require "../src/win_api.cr"

include WinAPI

CLASS_NAME = to_lpcwstr("WIN_CLASS1")
WINDOW_TITLE = to_lpcwstr("MyApp")


def winproc(hwnd : LibWinAPI::HWND, uMsg : UInt32, wParam : LibWinAPI::WPARAM, lParam : LibWinAPI::LPARAM) : LibWinAPI::LRESULT
  case (uMsg)
  when LibWinAPI::WM_CREATE
    return 0_u16.unsafe_as(LibWinAPI::LRESULT)
  when LibWinAPI::WM_DESTROY
    LibWinAPI.PostQuitMessage(0)
    return 0_u16
  when LibWinAPI::WM_PAINT
    ps = LibWinAPI::PAINTSTRUCT.new
    hdc = LibWinAPI.BeginPaint(hwnd, pointerof(ps))
    psrcPaint = ps.rcPaint
    LibWinAPI.FillRect(hdc, pointerof(psrcPaint), (LibWinAPI::COLOR_WINDOW + 1).unsafe_as(LibWinAPI::HBRUSH))
    ps.rcPaint = psrcPaint
    LibWinAPI.EndPaint(hwnd, pointerof(ps))
    return 0_u16
  end
  return LibWinAPI.DefWindowProcW(hwnd, uMsg, wParam, lParam)
end

hInstance = LibWinAPI.GetModuleHandleW(nil)
hPrevInstance = Pointer(Void).null

funptr =->winproc(LibWinAPI::HWND, UInt32, LibWinAPI::WPARAM, LibWinAPI::LPARAM).pointer
wc = LibWinAPI::WNDCLASSEXW.new
wc.cbSize = sizeof(LibWinAPI::WNDCLASSEXW)
wc.lpfnWndProc = funptr
wc.lpszClassName = CLASS_NAME
wc.lpszMenuName = WINDOW_TITLE
wc.style = LibWinAPI::CS_HREDRAW | LibWinAPI::CS_VREDRAW
wc.cbClsExtra = 0
wc.cbWndExtra = 0
wc.style = 0
wc.hInstance = hInstance

if LibWinAPI.RegisterClassExW(pointerof(wc)) == 0
  err = LibC.GetLastError
  raise "window class register failed because #{err}"
  exit 1
end

hwnd = LibWinAPI.CreateWindowExW(
  0,          # Optional window styles
  CLASS_NAME, # Window class
  WINDOW_TITLE,
  LibWinAPI::WS_OVERLAPPEDWINDOW, # Window style
  # Size and position
  LibWinAPI::CW_USEDEFAULT, LibWinAPI::CW_USEDEFAULT, LibWinAPI::CW_USEDEFAULT, LibWinAPI::CW_USEDEFAULT,
  nil,                                  # Parent window
  nil,                                  # Menu
  hInstance,                            # Instance handle
  nil                                   # Additional application data
)

nCmdShow = 1
LibWinAPI.ShowWindow(hwnd, nCmdShow)
msg = LibWinAPI::MSG.new
while (LibWinAPI.GetMessageW(pointerof(msg), nil, 0, 0) > 0)
  LibWinAPI.TranslateMessage(pointerof(msg))
  LibWinAPI.DispatchMessageW(pointerof(msg))
end