lib LibWinAPI
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

  alias LRESULT = UInt16
  alias LPCWSTR = UInt16*
  alias LPCTSTR = UInt8*
  type LPARAM = UInt16*
  type WPARAM = UInt32*
  alias DWORD = UInt32
  alias WORD = UInt16
end