
@[Link("user32")]
lib LibWinAPI
  GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT = 2

  WM_DESTROY   =   2
  WM_PAINT     = 0xF
  WM_CREATE    = 0x0001
  COLOR_WINDOW =   5

  IDC_ARROW = 32512_u16
  IDI_APPLICATION = 32512_u16

  WHITE_BRUSH = 0x80000000

  CS_HREDRAW = 1
  CS_VREDRAW = 2

  WS_OVERLAPPEDWINDOW = 0x00000000
  CW_USEDEFAULT = Int32::MIN

  struct POINT
    x, y : Int32
  end

  struct MSG
    hwnd : HWND
    message : UInt32
    wParam : WPARAM
    lParam : LPARAM
    time : Int32
    pt : POINT
  end

  struct RECT
    left : Int32
    top : Int32
    right : Int32
    bottom : Int32
  end

  struct PAINTSTRUCT
    hdc : HDC
    fErase : Bool
    rcPaint : RECT
    fRestore : Bool
    fIncUpdate : Bool
    rgbReserved : UInt8[32]
  end

  alias LPPAINTSTRUCT = PAINTSTRUCT*

  alias LPMSG = MSG*

  struct WNDCLASSEXW
    cbSize, style : UInt32
    lpfnWndProc : Void*
    cbClsExtra, cbWndExtra : Int32
    hInstance : HINSTANCE
    hIcon : HICON
    hCursor : HCURSOR
    hbrBackground : HBRUSH
    lpszMenuName, lpszClassName : LPCWSTR
    hIconSm : HICON
  end

  alias PWNDCLASSEXW = WNDCLASSEXW*
  alias NPWNDCLASSEXW = WNDCLASSEXW*
  alias LPWNDCLASSEXW = WNDCLASSEXW*
  alias WNDCLASSEX = WNDCLASSEXW
  alias PWNDCLASSEX = WNDCLASSEXW*
  alias NPWNDCLASSEX = WNDCLASSEXW*
  alias LPWNDCLASSEX = WNDCLASSEXW*


  fun CreateWindowExW(dwExStyle : DWORD, lpClassName : LPCWSTR, lpWindowName : LPCWSTR, dwStyle : DWORD, x : Int32, y : Int32, nWidth : Int32, nHeight : Int32, hWndParent : HWND, hMenu : HMENU, hInstance : HINSTANCE, lpParam : LPVOID) : HWND
  fun DefWindowProcW(hWnd : HWND, msg : UInt32, wParam : WPARAM, lParam : LPARAM) : LRESULT
  fun RegisterClassExW(unnamedParam1 : WNDCLASSEXW*) : ATOM
  fun UnregisterClassW(lpClassName : LPCWSTR, hInstance : HINSTANCE) : Bool
  fun MessageBoxW(hWnd : HWND, lpText : LPCWSTR, lpCaption : LPCWSTR, uType : UInt32) : Int32
  fun MessageBoxExW(hWnd : HWND, lpText : LPCWSTR, lpCaption : LPCWSTR, uType : UInt32, wLanguageId : WORD) : Int32
  fun TranslateMessage(lpMsg : MSG*) : Int32
  fun DispatchMessageW(lpMsg : MSG*) : Void*
  fun ShowWindow(hWnd : HWND, nCmdShow : Int32) : Int32
  fun BeginPaint(hWnd : HWND, lpPaint : LPPAINTSTRUCT) : HDC
  fun FillRect(hDC : HDC, lprc : RECT*, hbr : HBRUSH) : Int32
  fun EndPaint(hWnd : HWND, lpPaint : PAINTSTRUCT*) : Bool
  fun PostQuitMessage(nExitCode : Int32) : Void
  fun GetMessageW(lpMsg : LPMSG, hWnd : HWND, wMsgFilterMin : UInt32, wMsgFilterMax : UInt32) : Int32
end