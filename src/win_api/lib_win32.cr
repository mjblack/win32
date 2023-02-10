require "./lib_win32/datatypes.cr"
require "./lib_win32/winuser.cr"
lib LibWin32


  fun GetModuleHandleW(lpModuleName : Void*) : HINSTANCE
end