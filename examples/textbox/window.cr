require "../../src/win32.cr"

include Win32

module AppData
  class_property hInstance : LibWin32::HINSTANCE?
  class_property hPrevInstance : Void*?
  class_property hwnd : LibWin32::HWND?
  class_property hwndEdit : LibWin32::HWND?
end

IDM_EXIT = 105_u64
IDM_ABOUT = 200_u64
ID_EDIT_BOX = 300_u64

CLASS_NAME = to_lpcwstr("WIN_CLASS1")
MENU_NAME = to_lpcwstr("ExampleWindow")
APP_NAME = to_lpcwstr("Simple Window")

nARGV = Array.new(ARGC_UNSAFE) do |i|
          String.new(ARGV_UNSAFE[i])
        end
pARGV = to_lpcwstr(PROGRAM_NAME + " " + nARGV.join(" ") + "\0")

winARGV = LibWin32.CommandLineToArgvW(pARGV, out winARGC)
hInstance = LibWin32.GetModuleHandleW(nil)
G_HINSTANCE = hInstance
hPrevInstance = Pointer(Void).null
AppData.hInstance = hInstance
AppData.hPrevInstance = hPrevInstance

def winproc(hwnd : LibWin32::HWND, uMsg : UInt64, wParam : LibWin32::WPARAM, lParam : LibWin32::LPARAM) : LibWin32::LRESULT
  lresult = 0_i64
  case uMsg
  when LibWin32::WM_CREATE
    hwndEdit = LibWin32.CreateWindowExW(
        LibWin32::WS_EX_CLIENTEDGE,                                   # Optional window styles
        to_lpcwstr("edit"),                                           # Window class
        nil,                                                          # Application Name
        LibWin32::WS_CHILD | LibWin32::WS_VISIBLE |
        LibWin32::WS_BORDER | LibWin32::WS_HSCROLL |
        LibWin32::ES_AUTOHSCROLL | LibWin32::ES_MULTILINE |
        LibWin32::ES_WANTRETURN,                                      # Window style
        0, 0, 0, 0,                                                   # Size and position
        hwnd,                                                         # Parent window
        pointerof(ID_EDIT_BOX).unsafe_as(LibWin32::HMENU),            # Menu
        lParam.unsafe_as(LibWin32::LPCREATESTRUCTW).value.hInstance,  # Instance handle
        nil                                                           # Additional application data
    )

    if hwndEdit.null?
      err = LibC.GetLastError
      LibWin32.MessageBoxW(nil, "Got error #{err}".to_utf16, "winapp log".to_utf16, 0x10)

    end
    AppData.hwndEdit = hwndEdit
  when LibWin32::WM_SETFOCUS
    LibWin32.SetFocus(AppData.hwndEdit.not_nil!)
  when LibWin32::WM_SIZE
    LibWin32.MoveWindow(AppData.hwndEdit.not_nil!, 0, 0, loword(lParam), hiword(pointerof(lParam)), LibWin32::TRUE)
  when LibWin32::WM_COMMAND

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



icon = nil
cursor = nil

funptr =->winproc(LibWin32::HWND, UInt64, LibWin32::WPARAM, LibWin32::LPARAM).pointer
wc = LibWin32::WNDCLASSEXW.new
wc.cbSize = sizeof(LibWin32::WNDCLASSEXW)
wc.lpfnWndProc = funptr
wc.lpszClassName = CLASS_NAME
#wc.lpszMenuName = MENU_NAME
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
  APP_NAME,   # Application Name
  LibWin32::WS_OVERLAPPEDWINDOW, # Window style
  # Size and position
  LibWin32::CW_USEDEFAULT, LibWin32::CW_USEDEFAULT, LibWin32::CW_USEDEFAULT, LibWin32::CW_USEDEFAULT,
  nil,                                  # Parent window
  nil,                                  # Menu
  hInstance,                            # Instance handle
  nil                                   # Additional application data
)

AppData.hwnd = hwnd

LibWin32.ShowWindow(hwnd, LibWin32::SW_NORMAL)
LibWin32.UpdateWindow(hwnd)

while (LibWin32.GetMessageW(out msg, nil, 0, 0) > 0)
  pmsg = pointerof(msg)
  LibWin32.TranslateMessage(pmsg)
  LibWin32.DispatchMessageW(pmsg)
end