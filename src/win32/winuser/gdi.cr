module Win32
  module Winuser
    module GDI

      struct Resource
        property name : String
        def initialize(@name : String)

        end

        def initialize(resourceId : Int32 | UInt32)
          @name = resourceId.to_s
        end

        def pointer
          return @name.to_utf16
        end
      end

      def self.load_icon(hInstance : LibWin32::HINSTANCE, resource : Resource) : LibWin32::HICON
        icon = LibWin32.LoadIconW(hInstance, resource)
        icon
      end

      def self.load_cursor(hInstance : LibWin32::HINSTANCE, resource : Resource) : LibWin32::HCURSOR
        cursor = LibWin32.LoadCursorW(hInstance, resource)
        cusror
      end
    end
  end
end