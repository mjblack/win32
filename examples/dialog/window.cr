require "../../src/win32.cr"
module AppData
  class_property hInstance : LibWin32::HINSTANCE?
  class_property hPrevInstance : Void*?
  class_property hwnd : LibWin32::HWND?
  class_property hdlg : LibWin32::HWND?
end

include Win32

IDM_EXIT = 105_u64
IDM_ABOUT = 203_u64

CLASS_NAME = to_lpcwstr("WIN_CLASS1")
MENU_NAME = to_lpcwstr("ExampleWindow")
APP_NAME = to_lpcwstr("Dialog Box Window")

nARGV = Array.new(ARGC_UNSAFE) do |i|
          String.new(ARGV_UNSAFE[i])
        end
pARGV = to_lpcwstr(PROGRAM_NAME + " " + nARGV.join(" ") + "\0")

winARGV = LibWin32.CommandLineToArgvW(pARGV, out winARGC)

AppData.hInstance = LibWin32.GetModuleHandleW(nil)
AppData.hPrevInstance = Pointer(Void).null
hInstance = AppData.hInstance.unsafe_as(LibWin32::HINSTANCE)

def dialogproc(hDlg : LibWin32::HWND, uMsg : LibWin32::UINT, wParam : LibWin32::WPARAM, lParam : LibWin32::LPARAM) : LibWin32::INT_PTR
  case uMsg
  when LibWin32::WM_INITDIALOG
    hwndOwner = LibWin32.GetParent(hDlg)
    if hwndOwner.null?
      hwndOwner = LibWin32.GetDesktopWindow
    end

    LibWin32.GetWindowRect(hwndOwner, out rcOwner)
    LibWin32.GetWindowRect(hDlg, out rcDlg)
    LibWin32.CopyRect(out rc, pointerof(rcOwner))


    rcDlg.bottom -= rcDlg.top
    rcDlg.right -= rcDlg.left

    rcDlg.left = (rc.right - rcDlg.right) / 2
    rcDlg.top = (rc.bottom - rcDlg.bottom) / 2

    if !(LibWin32.GetWindowLongPtrW(hDlg, LibWin32::GWL_STYLE) & LibWin32::WS_CHILD)
      LibWin32.MapWindowPoints(hwndOwner, LibWin32.GetDesktopWindow, rcDlg.unsafe_as(LibWin32::LPPOINT), 1)
    end

    LibWin32.SetWindowPos(hDlg, nil, rcDlg.left, rcDlg.top, 0, 0, LibWin32::SWP_NOSIZE | LibWin32::SWP_NOZORDER)
    if (LibWin32.GetDlgCtrlID(wParam.unsafe_as(LibWin32::HWND)) != IDM_ABOUT)
      LibWin32.SetFocus(LibWin32.GetDlgItem(hDlg, IDM_ABOUT))
      return LibWin32::FALSE
    end
    return LibWin32::TRUE
  when LibWin32::WM_COMMAND
    if loword(wParam) == LibWin32::IDOK || loword(wParam) == LibWin32::IDCANCEL
      LibWin32.EndDialog(hDlg, loword(wParam))
      return LibWin32::TRUE
    end
  end
  return LibWin32::FALSE
end



def winproc(hwnd : LibWin32::HWND, uMsg : LibWin32::UINT, wParam : LibWin32::WPARAM, lParam : LibWin32::LPARAM) : LibWin32::LRESULT
  lresult = 0_i64
  case uMsg
  when LibWin32::WM_CREATE
    hMenu = LibWin32.CreateMenu
    hFileMenu = LibWin32.CreatePopupMenu
    hHelpMenu = LibWin32.CreatePopupMenu

    LibWin32.AppendMenuW(hFileMenu, LibWin32::MF_STRING, IDM_EXIT, to_lpcwstr("E&xit"))
    LibWin32.AppendMenuW(hMenu, LibWin32::MF_STRING | LibWin32::MF_POPUP, hFileMenu.unsafe_as(LibWin32::UINT_PTR), to_lpcwstr("&File"))

    LibWin32.AppendMenuW(hHelpMenu, LibWin32::MF_STRING, IDM_ABOUT, to_lpcwstr("About"))
    LibWin32.AppendMenuW(hMenu, LibWin32::MF_STRING | LibWin32::MF_POPUP, hHelpMenu.unsafe_as(LibWin32::UINT_PTR), to_lpcwstr("Help"))
    LibWin32.SetMenu(hwnd, hMenu)
  when LibWin32::WM_COMMAND
    case loword(wParam)
    when IDM_EXIT
      LibWin32.PostMessageW(hwnd, LibWin32::WM_CLOSE, 0_u64, 0_i64)
    when IDM_ABOUT
      funptr =->dialogproc(LibWin32::HWND, LibWin32::UINT, LibWin32::WPARAM, LibWin32::LPARAM).pointer
      rv = LibWin32.DialogBoxParamW(AppData.hInstance.unsafe_as(LibWin32::HINSTANCE), IDM_ABOUT, hwnd, funptr, 0)
      if rv == -1
        err = LibC.GetLastError
        LibWin32.MessageBoxW(nil, to_lpcwstr("Error creating dialog box: #{err}"), to_lpcwstr("Debug"), 0x10)
      end
    end
  when LibWin32::WM_CLOSE
    LibWin32.DestroyWindow(hwnd)
    LibWin32.PostQuitMessage(0)
  when LibWin32::WM_DESTROY
    LibWin32.PostQuitMessage(0)
  when LibWin32::WM_PAINT
    ps = LibWin32::PAINTSTRUCT.new
    hdc = LibWin32.BeginPaint(hwnd, pointerof(ps))
    psrcPaint = ps.rcPaint
    LibWin32.FillRect(hdc, pointerof(psrcPaint), (LibWin32::COLOR_WINDOW + 1).unsafe_as(LibWin32::HBRUSH))
    ps.rcPaint = psrcPaint
    LibWin32.EndPaint(hwnd, pointerof(ps))
  else
    return LibWin32.DefWindowProcW(hwnd, uMsg, wParam, lParam)
  end
  return lresult
end



icon = LibWin32.LoadIconW(pointerof(hInstance), pointerof(LibWin32::IDI_APPLICATION))
cursor = LibWin32.LoadCursorW(pointerof(hInstance), pointerof(LibWin32::IDC_ARROW))

funptr =->winproc(LibWin32::HWND, LibWin32::UINT, LibWin32::WPARAM, LibWin32::LPARAM).pointer
wc = LibWin32::WNDCLASSEXW.new
wc.cbSize = sizeof(LibWin32::WNDCLASSEXW)
wc.lpfnWndProc = funptr
wc.lpszClassName = CLASS_NAME
wc.style = LibWin32::CS_HREDRAW | LibWin32::CS_VREDRAW
wc.cbClsExtra = 0
wc.cbWndExtra = 0
wc.hInstance = AppData.hInstance.unsafe_as(LibWin32::HINSTANCE)
wc.hIcon = icon

if LibWin32.RegisterClassExW(pointerof(wc)) == 0
  err = LibC.GetLastError
  raise "window class register failed because #{err}"
  exit 1
end

hwnd = LibWin32.CreateWindowExW(
  0,          # Optional window styles
  CLASS_NAME, # Window class
  APP_NAME,
  LibWin32::WS_OVERLAPPEDWINDOW, # Window style
  # Size and position
  LibWin32::CW_USEDEFAULT, LibWin32::CW_USEDEFAULT, LibWin32::CW_USEDEFAULT, LibWin32::CW_USEDEFAULT,
  nil,                                  # Parent window
  nil,                                  # Menu
  hInstance,                            # Instance handle
  nil                                   # Additional application data
)

LibWin32.ShowWindow(hwnd, LibWin32::SW_NORMAL)
LibWin32.UpdateWindow(hwnd)

while (LibWin32.GetMessageW(out msg, nil, 0, 0) > 0)
  pmsg = pointerof(msg)
  LibWin32.TranslateMessage(pmsg)
  LibWin32.DispatchMessageW(pmsg)
end