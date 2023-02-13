require "./winuser/gdi.cr"

lib LibWin32

  DWLP_MSGRESULT  = 0
  GWLP_WNDPROC    = -4
  GWLP_HINSTANCE  = -6
  GWLP_HWNDPARENT = -8
  GWLP_ID         = -12
  GWL_STYLE       = -16
  GWL_EXSTYLE     = -20
  GWLP_USERDATA   = -21

  DWLP_DLGPROC    = (DWLP_MSGRESULT + sizeof(LRESULT))
  DWLP_USER       = (DWLP_DLGPROC  + sizeof(DLGPROC))

  struct CREATESTRUCTW
    lpCreateParams : Void*
    hInstance : HINSTANCE
    hMenu : HMENU
    hwndParent : HWND
    cy, cx, y, x, style, dwExStyle: Int32
    lpszName, lpszClass : UInt16*
  end

  alias LPCREATESTRUCTW = CREATESTRUCTW*

  struct StateInfo
    state : Void*
  end

  fun GetWindowLongPtrW(hWnd : HWND, nIndex : Int32) : LONG_PTR
  fun SetWindowLongPtrW(hWnd : HWND, nIndex : Int32, dwNewLong : Int32*) : LONG_PTR
end