lib LibWin32
  type ATOM = LibC::WORD
  type PVOID = Void*
  type LPVOID = PVOID
  type HANDLE = PVOID
  type HINSTANCE = HANDLE
  type HMODULE = HANDLE
  type HICON = HANDLE
  type HGDIOBJ = HANDLE
  type HCURSOR = HANDLE
  type HBRUSH = HANDLE
  type HMENU = HANDLE
  type HWND = HANDLE
  type HDC = HANDLE
  type HBITMAP = HANDLE
  type HPALETTE = HANDLE

  alias LRESULT = UInt16
  alias LPCWSTR = UInt16*
  alias LPWSTR = UInt16*
  alias LPCTSTR = UInt8*
  alias LPARAM = UInt16*
  alias WPARAM = UInt32*
  alias DWORD = UInt32
  alias WORD = UInt16
end