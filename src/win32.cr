require "./crystal/override.cr"
require "./win32/lib_win32.cr"
require "./win32/winuser/gdi.cr"

module Win32
  VERSION = "0.1.0"

  def to_lpcwstr(str : String)
    return str.to_utf16.to_unsafe.as(LibWin32::LPCWSTR)
  end

  # Covers for this C macro
  # #define LOWORD(l)           ((WORD)(((DWORD_PTR)(l)) & 0xffff))
  def loword(i : UInt64) : UInt16
    val = (i & 0xffff).to_u16
    val
  end

  def loword(i : Int64) : UInt16
    val = (i.to_u64 & 0xffff).to_u16
    val
  end

  # Covers for this C macro
  # #define HIWORD(l)           ((WORD)((((DWORD_PTR)(l)) >> 16) & 0xffff))
  def hiword(i : UInt32*) : UInt16
    val = ((i.value >> 16) & 0xFFFF).to_u16
    val
  end

  def hiword(i : Int64*) : UInt16
    val = ((i.value.to_u64 >> 16) & 0xFFFF).to_u16
    val
  end
end
