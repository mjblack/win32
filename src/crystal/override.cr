module Crystal::System::FileDescriptor
  def self.from_stdio(fd)
    console_handle = false
    handle = LibC._get_osfhandle(fd)
    if handle != -1 && handle != -2 # standard streams are unavailable
      handle = LibC::HANDLE.new(handle)
      old_mode = uninitialized LibC::DWORD
      if LibC.GetConsoleMode(handle, pointerof(old_mode)) != 0
        console_handle = true
        if fd == 1 || fd == 2 # STDOUT or STDERR
          if LibC.SetConsoleMode(handle, old_mode | LibC::ENABLE_VIRTUAL_TERMINAL_PROCESSING) != 0
            at_exit { LibC.SetConsoleMode(handle, old_mode) }
          end
        end
      end
    end

    # don't use `#system_info` to determine whether the descriptor should block,
    # as that raises because `fd` is invalid (non-blocking IO isn't supported yet anyway)
    io = IO::FileDescriptor.new(fd, blocking: true)
    if console_handle
      io.sync = true
    else
      io.flush_on_newline = true
    end
    io
  end
end

module Crystal
  def self.exit(status : Int32, exception : Exception?) : Int32
    status = Crystal::AtExitHandlers.run status, exception

    if exception
      title = "Unhandled Exception".to_utf16
      message = exception.inspect_with_backtrace.to_utf16
      LibWin32.MessageBoxW(nil, message, title, 0x10)
    end

    status
  end
end