require "./lib_win_api/datatypes.cr"
require "./lib_win_api/winuser.cr"
lib LibWinAPI


  fun GetModuleHandleW(lpModuleName : Void*) : HINSTANCE
end