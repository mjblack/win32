require "../src/win32.cr"

include Win32

CLASS_NAME = to_lpcwstr("WIN_CLASS1")
WINDOW_TITLE = to_lpcwstr("MyApp")


def winproc(hwnd : LibWin32::HWND, uMsg : UInt32, wParam : UInt32*, lParam : UInt16*) : LibWin32::LRESULT
  case (uMsg)
  when LibWin32::WM_CREATE
    hMenu = LibWin32.CreateMenu
    hSubMenu = LibWin32.CreatePopupMenu

    LibWin32.AppendMenuW(hSubMenu, LibWin32::MF_STRING, pointerof(LibWin32::ID_FILE_EXIT), to_lpcwstr("E&xit"))
    LibWin32.AppendMenuW(hMenu, LibWin32::MF_STRING | LibWin32::MF_POPUP, hSubMenu.as(Pointer(UInt32)), to_lpcwstr("&File"))
    LibWin32.SetMenu(hwnd, hMenu)
    return 0_u16.unsafe_as(LibWin32::LRESULT)
  when LibWin32::WM_COMMAND
    case wParam
    when LibWin32::ID_FILE_EXIT
      lword = wParam.value & 0xffff0000
      msg = "lword is #{lword.inspect}, wParam is #{wParam.inspect}".to_utf16

      LibWin32.MessageBoxW(nil, msg, "Debug".to_utf16, 0x10)
      case lword
      when LibWin32::ID_FILE_EXIT
        wP = 0_u32
        lP = 0_u16
        LibWin32.PostMessageW(hwnd, LibWin32::WM_CLOSE, pointerof(wP), pointerof(lP))
      end
    else
      msg = "command val was something else: #{wParam.as(Pointer(UInt16)).value}".to_utf16
      LibWin32.MessageBoxW(nil, msg, "Debug".to_utf16, 0x10)
    end
  when LibWin32::WM_CLOSE
    LibWin32.DestroyWindow(hwnd)
  when LibWin32::WM_DESTROY
    LibWin32.PostQuitMessage(0)
    return 0_u16
  when LibWin32::WM_PAINT
    ps = LibWin32::PAINTSTRUCT.new
    hdc = LibWin32.BeginPaint(hwnd, pointerof(ps))
    psrcPaint = ps.rcPaint
    LibWin32.FillRect(hdc, pointerof(psrcPaint), (LibWin32::COLOR_WINDOW + 1).unsafe_as(LibWin32::HBRUSH))
    ps.rcPaint = psrcPaint
    LibWin32.EndPaint(hwnd, pointerof(ps))
    return 0_u16
  end
  return LibWin32.DefWindowProcW(hwnd, uMsg, wParam, lParam)
end

hInstance = LibWin32.GetModuleHandleW(nil)
hPrevInstance = Pointer(Void).null
icon = LibWin32.LoadIconW(pointerof(hInstance), pointerof(LibWin32::IDI_APPLICATION))
cursor = LibWin32.LoadCursorW(pointerof(hInstance), pointerof(LibWin32::IDC_ARROW))

funptr =->winproc(LibWin32::HWND, UInt32, UInt32*, UInt16*).pointer
wc = LibWin32::WNDCLASSEXW.new
wc.cbSize = sizeof(LibWin32::WNDCLASSEXW)
wc.lpfnWndProc = funptr
wc.lpszClassName = CLASS_NAME
wc.lpszMenuName = WINDOW_TITLE
wc.style = LibWin32::CS_HREDRAW | LibWin32::CS_VREDRAW
wc.cbClsExtra = 0
wc.cbWndExtra = 0
wc.hInstance = hInstance
wc.hIcon = icon

if LibWin32.RegisterClassExW(pointerof(wc)) == 0
  err = LibC.GetLastError
  raise "window class register failed because #{err}"
  exit 1
end

hwnd = LibWin32.CreateWindowExW(
  0,          # Optional window styles
  CLASS_NAME, # Window class
  WINDOW_TITLE,
  LibWin32::WS_OVERLAPPEDWINDOW, # Window style
  # Size and position
  LibWin32::CW_USEDEFAULT, LibWin32::CW_USEDEFAULT, LibWin32::CW_USEDEFAULT, LibWin32::CW_USEDEFAULT,
  nil,                                  # Parent window
  nil,                                  # Menu
  hInstance,                            # Instance handle
  nil                                   # Additional application data
)

nCmdShow = 1
LibWin32.ShowWindow(hwnd, nCmdShow)
LibWin32.UpdateWindow(hwnd)
LibWin32.DrawMenuBar(hwnd)
msg = LibWin32::MSG.new
while (LibWin32.GetMessageW(pointerof(msg), nil, 0, 0) > 0)
  LibWin32.TranslateMessage(pointerof(msg))
  LibWin32.DispatchMessageW(pointerof(msg))
end