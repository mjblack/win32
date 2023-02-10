require "./crystal/override.cr"
require "./win_api/lib_win32.cr"
module Win32
  VERSION = "0.1.0"

  def to_lpcwstr(str : String)
    return str.to_utf16.to_unsafe.as(LibWin32::LPCWSTR)
  end

end
