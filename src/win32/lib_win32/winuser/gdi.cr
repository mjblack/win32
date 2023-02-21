
@[Link("user32")]
lib LibWin32
  GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT = 2

  HWND_TOP        =  0.unsafe_as(HWND)
  HWND_BOTTOM     =  1.unsafe_as(HWND)
  HWND_TOPMOST    = -1.unsafe_as(HWND)
  HWND_NOTOPMOST  = -2.unsafe_as(HWND)

  COLOR_SCROLLBAR               = 0
  COLOR_BACKGROUND              = 1
  COLOR_ACTIVECAPTION           = 2
  COLOR_INACTIVECAPTION         = 3
  COLOR_MENU                    = 4
  COLOR_WINDOW                  = 5
  COLOR_WINDOWFRAME             = 6
  COLOR_MENUTEXT                = 7
  COLOR_WINDOWTEXT              = 8
  COLOR_CAPTIONTEXT             = 9
  COLOR_ACTIVEBORDER            = 10
  COLOR_INACTIVEBORDER          = 11
  COLOR_APPWORKSPACE            = 12
  COLOR_HIGHLIGHT               = 13
  COLOR_HIGHLIGHTTEXT           = 14
  COLOR_BTNFACE                 = 15
  COLOR_BTNSHADOW               = 16
  COLOR_GRAYTEXT                = 17
  COLOR_BTNTEXT                 = 18
  COLOR_INACTIVECAPTIONTEXT     = 19
  COLOR_BTNHIGHLIGHT            = 20
  COLOR_3DDKSHADOW              = 21
  COLOR_3DLIGHT                 = 22
  COLOR_INFOTEXT                = 23
  COLOR_INFOBK                  = 24
  COLOR_HOTLIGHT                = 26
  COLOR_GRADIENTACTIVECAPTION   = 27
  COLOR_GRADIENTINACTIVECAPTION = 28
  COLOR_MENUHILIGHT             = 29
  COLOR_MENUBAR                 = 30
  COLOR_DESKTOP                 = COLOR_BACKGROUND
  COLOR_3DFACE                  = COLOR_BTNFACE
  COLOR_3DSHADOW                = COLOR_BTNSHADOW
  COLOR_3DHIGHLIGHT             = COLOR_BTNHIGHLIGHT
  COLOR_3DHILIGHT               = COLOR_BTNHIGHLIGHT
  COLOR_BTNHILIGHT              = COLOR_BTNHIGHLIGHT

  SW_HIDE            = 0
  SW_NORMAL          = 1
  SW_SHOWNORMAL      = 1
  SW_SHOWMINIMIZED   = 2
  SW_MAXIMIZE        = 3
  SW_SHOWMAXIMIZED   = 3
  SW_SHOWNOACTIVATE  = 4
  SW_SHOW            = 5
  SW_MINIMIZE        = 6
  SW_SHOWMINNOACTIVE = 7
  SW_SHOWNA          = 8
  SW_RESTORE         = 9
  SW_SHOWDEFAULT     = 10
  SW_FORCEMINIMIZE   = 11

  # Window Notification

  WM_ACTIVATEAPP            = 0x001C_u32
  WM_CANCELMODE             = 0x001F_u32
  WM_CHILDACTIVATE          = 0x0022_u32
  WM_CLOSE                  = 0x0010_u32
  WM_COMPACTING             = 0x0041_u32
  WM_CREATE                 = 0x0001_u32
  WM_DESTROY                = 0x0002_u32
  WM_ENABLE                 = 0x000A_u32
  WM_ENTERSIZEMOVE          = 0x0231_u32
  WM_EXITSIZEMOVE           = 0x0232_u32
  WM_GETICON                = 0x007F_u32
  WM_GETMINMAXINFO          = 0x0024_u32
  WM_INPUTLANGCHANGE        = 0x0051_u32
  WM_INPUTLANGCHANGEREQUEST = 0x0050_u32
  WM_MOVE                   = 0x0003_u32
  WM_MOVING                 = 0x0216_u32
  WM_NCACTIVATE             = 0x0086_u32
  WM_NCCALCSIZE             = 0x0083_u32
  WM_NCCREATE               = 0x0081_u32
  WM_NCDESTROY              = 0x0082_u32
  WM_NULL                   = 0x0000_u32
  WM_QUERYDRAGICON          = 0x0037_u32
  WM_QUERYOPEN              = 0x0013_u32
  WM_QUIT                   = 0x0012_u32
  WM_SHOWWINDOW             = 0x0018_u32
  WM_SIZE                   = 0x0005_u32
  WM_SIZING                 = 0x0214_u32
  WM_STYLECHANGED           = 0x007D_u32
  WM_STYLECHANGING          = 0x007C_u32
  WM_THEMECHANGED           = 0x031A_u32
  WM_USERCHANGED            = 0x0054_u32  # Might not be needed
  WM_WINDOWPOSCHANGED       = 0x0047_u32
  WM_WINDOWPOSCHANGING      = 0x0046_u32

  WM_ERASEBKGND      = 0x0014_u32
  WM_GETFONT         = 0x0031_u32
  WM_GETTEXT         = 0x000D_u32
  WM_GETTEXTLENGTH   = 0x000E_u32
  WM_SETFONT         = 0x0030_u32
  WM_SETICON         = 0x0080_u32
  WM_SETTEXT         = 0x000C_u32

  # Painting and Drawing

  WM_DISPLAYCHANGE   = 0x007E_u32
  WM_NCPAINT         = 0x0085_u32
  WM_PAINT           = 0x000F_u32
  WM_PRINT           = 0x0317_u32
  WM_PRINTCLIENT     = 0x0318_u32
  WM_SETREDRAW       = 0x000B_u32
  WM_SYNCPAINT       = 0x0088_u32

  # Menus
  WM_COMMAND    = 0x0111_u32

  # Dialog Boxes
  WM_INITDIALOG = 0x0110_u32

  # Keyboard Input Notifications

  WM_ACTIVATE         = 0x0006
  WM_APPCOMMAND       = 0x0319
  WM_CHAR             = 0x0102
  WM_DEADCHAR         = 0x0103
  WM_HOTKEY           = 0x0312
  WM_KEYDOWN          = 0x0100
  WM_KEYUP            = 0x0101
  WM_KEYFOCUS         = 0x0008
  WM_SETFOCUS         = 0x0007_u32
  WM_SYSDEADCHAR      = 0x0107
  WM_SYSKEYDOWN       = 0x0104
  WM_SYSKEYUP         = 0x0105
  WM_UNICHAR          = 0x0109
  WHITE_BRUSH = 0x80000000

  CS_HREDRAW = 1
  CS_VREDRAW = 2

  WS_BORDER           = 0x00800000
  WS_CAPTION          = 0x00C00000
  WS_CHILD            = 0x40000000
  WS_CHILDWINDOW      = 0x40000000
  WS_CLIPCHILDREN     = 0x02000000
  WS_CLIPSIBLINGS     = 0x04000000
  WS_DISABLED         = 0x08000000
  WS_DLGFRAME         = 0x00400000
  WS_GROUP            = 0x00020000
  WS_HSCROLL          = 0x00100000
  WS_ICONIC           = 0x20000000
  WS_MAXIMIZE         = 0x01000000
  WS_MAXIMIZEBOX      = 0x00010000
  WS_MINIMIZE         = 0x20000000
  WS_MINIMIZEBOX      = 0x00020000
  WS_OVERLAPPED       = 0x00000000
  WS_OVERLAPPEDWINDOW = WS_OVERLAPPED | WS_CAPTION | WS_SYSMENU | WS_THICKFRAME | WS_MINIMIZEBOX | WS_MAXIMIZEBOX
  WS_POPUP            = 0x80000000
  WS_POPUPWINDOW      = WS_POPUP | WS_BORDER | WS_SYSMENU
  WS_SIZEBOX          = 0x00040000
  WS_SYSMENU          = 0x00080000
  WS_TABSTOP          = 0x00010000
  WS_THICKFRAME       = 0x00040000
  WS_TILED            = 0x00000000
  WS_TILEDWINDOW      = WS_OVERLAPPED | WS_CAPTION | WS_SYSMENU | WS_THICKFRAME | WS_MINIMIZEBOX | WS_MAXIMIZEBOX
  WS_VISIBLE          = 0x10000000
  WS_VSCROLL          = 0x00200000


  WS_EX_ACCEPTFILES         = 0x00000010
  WS_EX_APPWINDOW           = 0x00040000
  WS_EX_CLIENTEDGE          = 0x00000200
  WS_EX_COMPOSITED          = 0x02000000
  WS_EX_CONTEXTHELP         = 0x00000400
  WS_EX_CONTROLPARENT       = 0x00010000
  WS_EX_DLGMODALFRAME       = 0x00000001
  WS_EX_LAYERED             = 0x00080000
  WS_EX_LAYOUTRTL           = 0x00400000
  WS_EX_LEFT                = 0x00000000
  WS_EX_LEFTSCROLLBAR       = 0x00004000
  WS_EX_LTRREADING          = 0x00000000
  WS_EX_MDICHILD            = 0x00000040
  WS_EX_NOACTIVATE          = 0x08000000
  WS_EX_NOINHERITLAYOUT     = 0x00100000
  WS_EX_NOPARENTNOTIFY      = 0x00000004
  WS_EX_NOREDIRECTIONBITMAP = 0x00200000
  WS_EX_OVERLAPPEDWINDOW    = WS_EX_WINDOWEDGE | WS_EX_CLIENTEDGE
  WS_EX_PALETTEWINDOW       = WS_EX_WINDOWEDGE | WS_EX_TOOLWINDOW | WS_EX_TOPMOST
  WS_EX_RIGHT               = 0x00001000
  WS_EX_RIGHTSCROLLBAR      = 0x00000000
  WS_EX_RTLREADING          = 0x00002000
  WS_EX_STATICEDGE          = 0x00020000
  WS_EX_TOOLWINDOW          = 0x00000080
  WS_EX_TOPMOST             = 0x00000008
  WS_EX_TRANSPARENT         = 0x00000020
  WS_EX_WINDOWEDGE          = 0x00000100

  # Edit Control Styles
  ES_LEFT             = 0x0000
  ES_CENTER           = 0x0001
  ES_RIGHT            = 0x0002
  ES_MULTILINE        = 0x0004
  ES_UPPERCASE        = 0x0008
  ES_LOWERCASE        = 0x0010
  ES_PASSWORD         = 0x0020
  ES_AUTOVSCROLL      = 0x0040
  ES_AUTOHSCROLL      = 0x0080
  ES_NOHIDESEL        = 0x0100
  ES_OEMCONVERT       = 0x0400
  ES_READONLY         = 0x0800
  ES_WANTRETURN       = 0x1000
  ES_NUMBER           = 0x2000

  MF_BYCOMMAND  = 0x00000000
  MF_BYPOSITION = 0x00000400

  MF_BITMAP       = 0x00000004
  MF_CHECKED      = 0x00000008
  MF_DISABLED     = 0x00000002
  MF_ENABLED      = 0x00000000
  MF_GRAYED       = 0x00000001
  MF_MENUBARBREAK = 0x00000020
  MF_MENUBREAK    = 0x00000040
  MF_OWNERDRAW    = 0x00000100
  MF_POPUP        = 0x00000010
  MF_SEPARATOR    = 0x00000800
  MF_STRING       = 0x00000000
  MF_UNCHECKED    = 0x00000000

  MIIM_BITMAP     = 0x00000080
  MIIM_CHECKMARKS = 0x00000008
  MIIM_DATA       = 0x00000020
  MIIM_FTYPE      = 0x00000100
  MIIM_ID         = 0x00000002
  MIIM_STATE      = 0x00000001
  MIIM_STRING     = 0x00000040
  MIIM_SUBMENU    = 0x00000004
  MIIM_TYPE       = 0x00000010

  MFT_BITMAP       = 0x00000004
  MFT_MENUBARBREAK = 0x00000020
  MFT_MENUBREAK    = 0x00000040
  MFT_OWNERDRAW    = 0x00000100
  MFT_RADIOCHECK   = 0x00000200
  MFT_RIGHTJUSTIFY = 0x00004000
  MFT_RIGHTORDER   = 0x00002000
  MFT_SEPARATOR    = 0x00000800
  MFT_STRING       = 0x00000000

  MFS_CHECKED   = 0x00000008
  MFS_DEFAULT   = 0x00001000
  MFS_DISABLED  = 0x00000003
  MFS_ENABLED   = 0x00000000
  MFS_GRAYED    = 0x00000003
  MFS_HILITE    = 0x00000080
  MFS_UNCHECKED = 0x00000000
  MFS_UNHILITE  = 0x00000000

  PM_NOREMOVE = 0x0000
  PM_REMOVE   = 0x0001
  PM_NOYIELD  = 0x0002

  IDOK       = 1
  IDCANCEL   = 2
  IDABORT    = 3
  IDRETRY    = 4
  IDIGNORE   = 5
  IDYES      = 6
  IDNO       = 7
  IDCLOSE    = 8
  IDHELP     = 9
  IDTRYAGAIN = 10
  IDCONTINUE = 11
  IDTIMEOUT  = 12

  SWP_NOSIZE         = 0x0001
  SWP_NOMOVE         = 0x0002
  SWP_NOZORDER       = 0x0004
  SWP_NOREDRAW       = 0x0008
  SWP_NOACTIVATE     = 0x0010
  SWP_FRAMECHANGED   = 0x0020
  SWP_SHOWWINDOW     = 0x0040
  SWP_HIDEWINDOW     = 0x0080
  SWP_NOCOPYBITS     = 0x0100
  SWP_NOOWNERZORDER  = 0x0200
  SWP_NOSENDCHANGING = 0x0400

  SWP_DRAWFRAME      = SWP_FRAMECHANGED
  SWP_NOREPOSITION   = SWP_NOOWNERZORDER

  SWP_DEFERERASE     = 0x2000
  SWP_ASYNCWINDOWPOS = 0x4000

  BS_PUSHBUTTON      =  0x00000000
  BS_DEFPUSHBUTTON   =  0x00000001
  BS_CHECKBOX        =  0x00000002
  BS_AUTOCHECKBOX    =  0x00000003
  BS_RADIOBUTTON     =  0x00000004
  BS_3STATE          =  0x00000005
  BS_AUTO3STATE      =  0x00000006
  BS_GROUPBOX        =  0x00000007
  BS_USERBUTTON      =  0x00000008
  BS_AUTORADIOBUTTON =  0x00000009
  BS_PUSHBOX         =  0x0000000A
  BS_OWNERDRAW       =  0x0000000B
  BS_TYPEMASK        =  0x0000000F
  BS_LEFTTEXT        =  0x00000020
  BS_TEXT            =  0x00000000
  BS_ICON            =  0x00000040
  BS_BITMAP          =  0x00000080
  BS_LEFT            =  0x00000100
  BS_RIGHT           =  0x00000200
  BS_CENTER          =  0x00000300
  BS_TOP             =  0x00000400
  BS_BOTTOM          =  0x00000800
  BS_VCENTER         =  0x00000C00
  BS_PUSHLIKE        =  0x00001000
  BS_MULTILINE       =  0x00002000
  BS_NOTIFY          =  0x00004000
  BS_FLAT            =  0x00008000
  BS_RIGHTBUTTON     =  BS_LEFTTEXT

  BST_UNCHECKED     = 0x0000
  BST_CHECKED       = 0x0001
  BST_INDETERMINATE = 0x0002
  BST_PUSHED        = 0x0004
  BST_FOCUS         = 0x0008

  # Edit Control Messages

  EM_GETSEL               = 0x00B0
  EM_SETSEL               = 0x00B1
  EM_GETRECT              = 0x00B2
  EM_SETRECT              = 0x00B3
  EM_SETRECTNP            = 0x00B4
  EM_SCROLL               = 0x00B5
  EM_LINESCROLL           = 0x00B6
  EM_SCROLLCARET          = 0x00B7
  EM_GETMODIFY            = 0x00B8
  EM_SETMODIFY            = 0x00B9
  EM_GETLINECOUNT         = 0x00BA
  EM_LINEINDEX            = 0x00BB
  EM_SETHANDLE            = 0x00BC
  EM_GETHANDLE            = 0x00BD
  EM_GETTHUMB             = 0x00BE
  EM_LINELENGTH           = 0x00C1
  EM_REPLACESEL           = 0x00C2
  EM_GETLINE              = 0x00C4
  EM_LIMITTEXT            = 0x00C5
  EM_CANUNDO              = 0x00C6
  EM_UNDO                 = 0x00C7
  EM_FMTLINES             = 0x00C8
  EM_LINEFROMCHAR         = 0x00C9
  EM_SETTABSTOPS          = 0x00CB
  EM_SETPASSWORDCHAR      = 0x00CC
  EM_EMPTYUNDOBUFFER      = 0x00CD
  EM_GETFIRSTVISIBLELINE  = 0x00CE
  EM_SETREADONLY          = 0x00CF
  EM_SETWORDBREAKPROC     = 0x00D0
  EM_GETWORDBREAKPROC     = 0x00D1
  EM_GETPASSWORDCHAR      = 0x00D2
  EM_SETMARGINS           = 0x00D3
  EM_GETMARGINS           = 0x00D4
  EM_SETLIMITTEXT         = EM_LIMITTEXT
  EM_GETLIMITTEXT         = 0x00D5
  EM_POSFROMCHAR          = 0x00D6
  EM_CHARFROMPOS          = 0x00D7
  EM_SETIMESTATUS         = 0x00D8
  EM_GETIMESTATUS         = 0x00D9
  EM_ENABLEFEATURE        = 0x00DA

  CW_USEDEFAULT = Int32::MIN

  struct POINT
    x, y : Int32
  end

  alias PPOINT = POINT*
  alias NPPOINT = POINT*
  alias LPPOINT = POINT*

  struct MSG
    hwnd : HWND
    message : UInt32
    wParam : WPARAM
    lParam : LPARAM
    time : DWORD
    pt : POINT
    #lPrivate : DWORD
  end

  alias PMSG = MSG*
  alias NPMSG = MSG*
  alias LPMSG = MSG*

  struct RECT
    left : Int32
    top : Int32
    right : Int32
    bottom : Int32
  end

  alias PRECT = RECT*
  alias NPRECT = RECT*
  alias LPRECT = RECT*

  struct PAINTSTRUCT
    hdc : HDC
    fErase : Bool
    rcPaint : RECT
    fRestore : Bool
    fIncUpdate : Bool
    rgbReserved : UInt8[32]
  end

  alias LPPAINTSTRUCT = PAINTSTRUCT*

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

  struct MENUITEMIMFOW
    cbSize, fMask, fType, fState, wID, cch : UInt32
    hSubMenu : HMENU
    hbmpChecked : HBITMAP
    hbmpUnchecked : HBITMAP
    dwItemData : UInt16*
    dwTypeData : LPWSTR
    hbmpItem : HBITMAP
  end

  alias LPMENUITEMINFOW = MENUITEMIMFOW*
  alias LPCMENUITEMINFO = MENUITEMIMFOW*

  struct MENUITEMTEMPLATE
    mtOption, mtID : WORD
    mtString : UInt16[1]
  end

  alias PMENUITEMTEMPLATE = MENUITEMTEMPLATE*

  struct MENUITEMTEMPLATEHEADER
    version, offset : WORD
  end

  alias PMENUITEMTEMPLATEHEADER = MENUITEMTEMPLATEHEADER*

  struct MENUEX_TEMPLATE_HEADER
    wVersion, wOffset : WORD
    dwHelpId : DWORD
  end

  struct MENUEX_TEMPLATE_ITEM
    dwType, dwState : DWORD
    uId : UInt32
    wFlags : WORD
    szText : UInt16[1]
  end

  struct DLGTEMPLATE
    style, dwExtendedStyle : DWORD
    cdit : WORD
    x, y, cx, cy : SHORT
  end

  alias LPCDLGTEMPLATE = DLGTEMPLATE*

  struct DLGITEMTEMPLATE
    style, dwExtendedStyle : DWORD
    x, y, cx, cy : SHORT
    id : WORD
  end

  fun GetDesktopWindow : HWND
  fun SetFocus(hWnd : HWND) : HWND
  fun CreateWindowExW(dwExStyle : DWORD, lpClassName : LPCWSTR, lpWindowName : LPCWSTR, dwStyle : DWORD, x : Int32, y : Int32, nWidth : Int32, nHeight : Int32, hWndParent : HWND, hMenu : HMENU, hInstance : HINSTANCE, lpParam : LPVOID) : HWND
  fun DestroyWindow(hwnd : HWND) : Bool
  fun EnableWindow(hWnd : HWND, bEnable : BOOL) : BOOL
  fun GetWindowText(hWnd : HWND, lpString : LPCWSTR, nMaxCount : Int32) : Int32
  fun GetWindowTextLengthW(hWnd : HWND) : Int32
  fun MoveWindow(hWnd : HWND, x : Int32, y : Int32, nWidth : Int32, nHeight : Int32, bRepaint : BOOL) : BOOL
  fun SetWindowTextW(hWnd : HWND, lpString : LPCWSTR) : BOOL
  fun SetWindowPos(hWnd : HWND, hWndInsertAfter : HWND, x : Int32, y : Int32, cx : Int32, cy : Int32, uFlags : UINT) : BOOL
  fun SendMessageW(hWnd : HWND, msg : UINT, wParam : WPARAM, lParam : LPARAM) : LRESULT
  fun GetParent(hWnd : HWND) : HWND
  fun CopyRect(lprcDst : LPRECT, lprcSrc : LPRECT) : BOOL
  fun GetWindowRect(hWnd : HWND, lpRect : LPRECT) : BOOL
  fun OffsetRect(lprc : LPRECT, dx : Int32, dy : Int32) : BOOL
  fun MapWindowPoints(hWndFrom : HWND, hWndTo : HWND, lpPoints : LPPOINT, cPoints : UINT) : Int32
  fun DefWindowProcW(hWnd : HWND, msg : UINT, wParam : WPARAM, lParam : LPARAM) : LRESULT
  fun RegisterClassExW(unnamedParam1 : WNDCLASSEXW*) : ATOM
  fun UnregisterClassW(lpClassName : LPCWSTR, hInstance : HINSTANCE) : Bool
  fun MessageBoxW(hWnd : HWND, lpText : LPCWSTR, lpCaption : LPCWSTR, uType : UInt32) : Int32
  fun MessageBoxExW(hWnd : HWND, lpText : LPCWSTR, lpCaption : LPCWSTR, uType : UInt32, wLanguageId : WORD) : Int32
  fun TranslateMessage(lpMsg : MSG*) : Bool
  fun DispatchMessageW(lpMsg : MSG*) : LRESULT
  fun ShowWindow(hWnd : HWND, nCmdShow : Int32) : Int32
  fun UpdateWindow(hWnd : HWND)
  fun BeginPaint(hWnd : HWND, lpPaint : LPPAINTSTRUCT) : HDC
  fun FillRect(hDC : HDC, lprc : RECT*, hbr : HBRUSH) : Int32
  fun EndPaint(hWnd : HWND, lpPaint : PAINTSTRUCT*) : Bool
  fun PostQuitMessage(nExitCode : Int32) : Void
  fun PostMessageW(hWnd : HWND, msg : UInt32, wParam : WPARAM, lParam : LPARAM) : Bool
  fun GetMessageW(lpMsg : LPMSG, hWnd : HWND, wMsgFilterMin : UInt32, wMsgFilterMax : UInt32) : BOOL
  fun PeekMessageW(lpMsg : LPMSG, hWnd : HWND, wMsgFilterMin : UINT, wMsgFilterMax : UINT, uRemoveMsg : UINT) : BOOL
  fun LoadIconW(hInstance : Void*, lpIconName : LPCWSTR) : HICON
  fun LoadCursorW(hInstance : Void*, lpCursorName : LPCWSTR) : HCURSOR
  fun GetStockObject(i : Int32) : HGDIOBJ
  fun CreateMenu : HMENU
  fun LoadMenuW(hInstance : HINSTANCE, lpMenuName : LPCWSTR) : HMENU
  fun LoadMenuIndirectW(lpMenuTemplate : Void*)
  fun GetSubMenu(hMenu : HMENU, nPos : Int32) : HMENU
  fun DrawMenuBar(hWnd : HWND) : Bool
  fun CreatePopupMenu : HMENU
  fun AppendMenuW(hMenu : HMENU, uFlags : UInt32, uIDNewItem : UINT_PTR, lpNewItem : LPCWSTR) : Bool
  fun GetMenu(hWnd : HWND) : HMENU
  fun SetMenu(hWnd : HWND, hMenu : HMENU) : HMENU
  fun DrawMenuBar(hWnd : HWND) : Bool
  fun InsertMenuW(hMenu : HMENU, uPosition : UInt32, uFlags : UInt32, uIDNewItem : UInt32*, lpNewItem : LPCWSTR) : Bool
  fun InsertMenuItemW(hMenu : HMENU, item : UInt32, fByPosition : Bool, lpmi : LPCMENUITEMINFO) : Bool
  fun DialogBoxParamW(hInstance : HINSTANCE, lpTemplate : ULONG_PTR, hWndParent : HWND, lpDialogFunc : Void*, dwInitParam : LPARAM) : INT_PTR
  fun CreateDialogW(hInstance : HINSTANCE, lpName : LPCTSTR, hWndParent : HWND, lpDialogFunc : Void*) : Void
  fun DialogBoxIndirectW(hInstance : HINSTANCE, lpTemplate : LPCDLGTEMPLATE, hWnd : HWND, lpDialogFunc : Void*)
  fun EndDialog(hwnd : HWND, nResult : INT_PTR) : BOOL
  fun CheckDlgButton(hwnd : HWND, nIDButton : Int32, uCheck : UINT) : BOOL
  fun GetDlgCtrlID(hWnd : HWND) : Int32
  fun GetDlgItem(hDlg : HWND, nIDDlgItem : Int32) : HWND


end