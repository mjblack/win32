lib LibWin32

  TRUE  = 1
  FALSE = 0

  type ATOM      = LibC::WORD
  type PVOID     = Void*
  type LPVOID    = PVOID
  type HANDLE    = PVOID
  type HINSTANCE = HANDLE
  type HMODULE   = HANDLE
  type HICON     = HANDLE
  type HGDIOBJ   = HANDLE
  type HCURSOR   = HANDLE
  type HBRUSH    = HANDLE
  type HMENU     = HANDLE
  type HWND      = HANDLE
  type HDC       = HANDLE
  type HBITMAP   = HANDLE
  type HPALETTE  = HANDLE
  type HLOCAL    = HANDLE

  alias BOOL   = Int32
  alias CHAR   = LibC::CHAR
  alias WCHAR  = LibC::WCHAR
  alias LONG   = LibC::LONG   # Int32
  alias UINT   = UInt32
  alias ULONG  = UINT
  alias SHORT  = Int16
  alias USHORT = UInt16

  alias UINT_PTR  = UInt64
  alias INT_PTR   = Int64
  alias ULONG_PTR = ULONG
  alias LONG_PTR  = Int64

  alias LRESULT = LONG_PTR
  alias LPCWSTR = WCHAR*
  alias LPWSTR  = WCHAR*
  alias LPCTSTR = CHAR*
  alias LPARAM  = LONG_PTR
  alias WPARAM  = UINT_PTR
  alias DWORD   = UInt32
  alias WORD    = UInt16
end