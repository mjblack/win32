require "./crystal/override.cr"
require "./win_api/lib_win_api.cr"
require "./win_api/lib_win_api/datatypes.cr"
module WinAPI
  VERSION = "0.1.0"

  def to_lpcwstr(str : String)
    return str.to_utf16.to_unsafe.as(LibWinAPI::LPCWSTR)
  end

end
