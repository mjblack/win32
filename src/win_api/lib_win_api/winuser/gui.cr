
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

  WS_OVERLAPPED = 0x00000000
  WS_CAPTION = 0x00C00000
  WS_SYSMENU = 0x00080000
  WS_THICKFRAME = 0x00040000
  WS_MINIMIZEBOX = 0x00020000
  WS_MAXIMIZEBOX = 0x00010000
  WS_OVERLAPPEDWINDOW = WS_OVERLAPPED | WS_CAPTION | WS_SYSMENU | WS_THICKFRAME | WS_MINIMIZEBOX | WS_MAXIMIZEBOX


  WS_EX_ACCEPTFILES = 0x00000010
  WS_EX_APPWINDOW = 0x00040000
  WS_EX_CLIENTEDGE = 0x00000200
  WS_EX_COMPOSITED = 0x02000000
  WS_EX_CONTEXTHELP = 0x00000400
  WS_EX_CONTROLPARENT = 0x00010000
  WS_EX_DLGMODALFRAME = 0x00000001
  WS_EX_LAYERED = 0x00080000
  WS_EX_LAYOUTRTL = 0x00400000
  WS_EX_LEFT = 0x00000000
  WS_EX_LEFTSCROLLBAR = 0x00004000
  WS_EX_LTRREADING = 0x00000000
  WS_EX_MDICHILD = 0x00000040
  WS_EX_NOACTIVATE = 0x08000000
  WS_EX_NOINHERITLAYOUT = 0x00100000
  WS_EX_NOPARENTNOTIFY = 0x00000004
  WS_EX_NOREDIRECTIONBITMAP = 0x00200000
  WS_EX_OVERLAPPEDWINDOW = WS_EX_WINDOWEDGE | WS_EX_CLIENTEDGE
  WS_EX_PALETTEWINDOW = WS_EX_WINDOWEDGE | WS_EX_TOOLWINDOW | WS_EX_TOPMOST
  WS_EX_RIGHT = 0x00001000
  WS_EX_RIGHTSCROLLBAR = 0x00000000
  WS_EX_RTLREADING = 0x00002000
  WS_EX_STATICEDGE = 0x00020000
  WS_EX_TOOLWINDOW = 0x00000080
  WS_EX_TOPMOST = 0x00000008
  WS_EX_TRANSPARENT = 0x00000020
  WS_EX_WINDOWEDGE = 0x00000100


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
  fun LoadIconW(hInstance : Void*, lpIconName : LPCWSTR) : HICON
  fun LoadCursorW(hInstance : Void*, lpCursorName : LPCWSTR) : HCURSOR
  fun MAKEINTRESOURCEW(Int32) : Void*
  fun GetStockObject(i : Int32) : HGDIOBJ
end