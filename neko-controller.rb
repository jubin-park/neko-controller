#===============================================================================
if !$NEKO_RUBY.nil?
#-------------------------------------------------------------------------------
module SDL
  class << self
    alias_method(:handle_pad_touch, :handlePadTouch)
    def handlePadTouch(finger_id, unit_x, unit_y, touch_type)
      NekoControllerManager.listen(finger_id, unit_x, unit_y, touch_type) if !NekoControllerManager.entity.nil?
      handle_pad_touch(finger_id, unit_x, unit_y, touch_type)
    end
  end
end
#-------------------------------------------------------------------------------
end
#===============================================================================

#===============================================================================
if !$NEKO_RUBY.nil?
#-------------------------------------------------------------------------------
# https://wiki.libsdl.org/StuartPBentley/CombinedKeyTable
module SDL
  module Key
    A = 97
    AMPERSAND = 38
    ASTERISK = 42
    AT = 64
    B = 98
    BACKQUOTE = 96
    BACKSLASH = 92
    BACKSPACE = 8
    C = 99
    CAPSLOCK = 1073741881
    CARET = 94
    CLEAR = 1073741980
    COLON = 58
    COMMA = 44
    D = 100
    DELETE = 127
    DOLLAR = 36
    DOWN = 1073741905
    E = 101
    #END = 1073741901
    EQUALS = 61
    ESCAPE = 27
    EXCLAIM = 33
    F = 102
    F1 = 1073741882
    F10 = 1073741891
    F11 = 1073741892
    F12 = 1073741893
    F13 = 1073741928
    F14 = 1073741929
    F15 = 1073741930
    F2 = 1073741883
    F3 = 1073741884
    F4 = 1073741885
    F5 = 1073741886
    F6 = 1073741887
    F7 = 1073741888
    F8 = 1073741889
    F9 = 1073741890
    G = 103
    GREATER = 62
    H = 104
    HASH = 35
    HELP = 1073741941
    HOME = 1073741898
    I = 105
    INSERT = 1073741897
    J = 106
    K = 107
    K0 = 48
    K1 = 49
    K2 = 50
    K3 = 51
    K4 = 52
    K5 = 53
    K6 = 54
    K7 = 55
    K8 = 56
    K9 = 57
    KP0 = 1073741922
    KP1 = 1073741913
    KP2 = 1073741914
    KP3 = 1073741915
    KP4 = 1073741916
    KP5 = 1073741917
    KP6 = 1073741918
    KP7 = 1073741919
    KP8 = 1073741920
    KP9 = 1073741921
    KP_DIVIDE = 1073741908
    KP_ENTER = 1073741912
    KP_EQUALS = 1073741927
    KP_MINUS = 1073741910
    KP_MULTIPLY = 1073741909
    KP_PERIOD = 1073741923
    KP_PLUS = 1073741911
    L = 108
    LALT = 1073742050
    LCTRL = 1073742048
    LEFT = 1073741904
    LEFTBRACKET = 91
    LEFTPAREN = 40
    LESS = 60
    LSHIFT = 1073742049
    M = 109
    MENU = 1073741942
    MINUS = 45
    MODE = 1073742081
    MOD_ALT = 768
    MOD_CAPS = 8192
    MOD_CTRL = 192
    MOD_LALT = 256
    MOD_LCTRL = 64
    MOD_LSHIFT = 1
    MOD_MODE = 16384
    MOD_NONE = 0
    MOD_NUM = 4096
    MOD_RALT = 512
    MOD_RCTRL = 128
    MOD_RESERVED = 32768
    MOD_RSHIFT = 2
    MOD_SHIFT = 3
    N = 110
    NUMLOCK = 1073741907
    O = 111
    P = 112
    PAGEDOWN = 1073741902
    PAGEUP = 1073741899
    PAUSE = 1073741896
    PERIOD = 46
    PLUS = 43
    POWER = 1073741926
    Q = 113
    QUESTION = 63
    QUOTE = 39
    QUOTEDBL = 34
    R = 114
    RALT = 1073742054
    RCTRL = 1073742052
    RETURN = 13
    RIGHT = 1073741903
    RIGHTBRACKET = 93
    RIGHTPAREN = 41
    RSHIFT = 1073742053
    S = 115
    SCROLLOCK = 1073741895
    SEMICOLON = 59
    SLASH = 47
    SPACE = 32
    SYSREQ = 1073741978
    T = 116
    TAB = 9
    U = 117
    UNDERSCORE = 95
    UNKNOWN = 0
    UP = 1073741906
    V = 118
    W = 119
    X = 120
    Y = 121
    Z = 122

    # ADDED
    GRAVE = 0x60
    APOSTROPHE = 0x27
    PRINTSCREEN = 0x80000046
    SCROLLLOCK = 0x80000047
    PAUSEBREAK = 0x80000048
    INSERT = 0x80000049
    HOME = 0x8000004A
    PAGEUP = 0x8000004B
    DELETE = 0xB1
    PAGEDOWN = 0x8000004E
    AC_BACK = 0x8000010E
  end
end
#-------------------------------------------------------------------------------
end
#===============================================================================

#===============================================================================
if $NEKO_RUBY.nil?
#-------------------------------------------------------------------------------
# https://docs.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes
# https://georezo.net/jparis/mb_r/dll/pages_user/virtual_key_codes.htm
module Virtual
  module Key
    LBUTTON = 0x01
    RBUTTON = 0x02
    CANCEL = 0x03
    MBUTTON = 0x04
    BACK = 0x08
    TAB = 0x09
    CLEAR = 0x0C
    RETURN = 0x0D
    SHIFT = 0x10
    CONTROL = 0x11
    MENU = 0x12
    PAUSE = 0x13
    CAPITAL = 0x14
    ESCAPE = 0x1B
    SPACE = 0x20
    PRIOR = 0x21
    NEXT = 0x22
    const_set(:END, 0x23) #END = 0x23
    HOME = 0x24
    LEFT = 0x25
    UP = 0x26
    RIGHT = 0x27
    DOWN = 0x28
    SELECT = 0x29
    PRINT = 0x2A
    EXECUTE = 0x2B
    SNAPSHOT = 0x2C
    INSERT = 0x2D
    DELETE = 0x2E
    HELP = 0x2F
    K0 = 0x30
    K1 = 0x31
    K2 = 0x32
    K3 = 0x33
    K4 = 0x34
    K5 = 0x35
    K6 = 0x36
    K7 = 0x37
    K8 = 0x38
    K9 = 0x39
    A = 0x41
    B = 0x42
    C = 0x43
    D = 0x44
    E = 0x45
    F = 0x46
    G = 0x47
    H = 0x48
    I = 0x49
    J = 0x4A
    K = 0x4B
    L = 0x4C
    M = 0x4D
    N = 0x4E
    O = 0x4F
    P = 0x50
    Q = 0x51
    R = 0x52
    S = 0x53
    T = 0x54
    U = 0x55
    V = 0x56
    W = 0x57
    X = 0x58
    Y = 0x59
    Z = 0x5A
    STARTKEY = 0x5B
    CONTEXTKEY = 0x5D
    NUMPAD0 = 0x60
    NUMPAD1 = 0x61
    NUMPAD2 = 0x62
    NUMPAD3 = 0x63
    NUMPAD4 = 0x64
    NUMPAD5 = 0x65
    NUMPAD6 = 0x66
    NUMPAD7 = 0x67
    NUMPAD8 = 0x68
    NUMPAD9 = 0x69
    MULTIPLY = 0x6A
    ADD = 0x6B
    SEPARATOR = 0x6C
    SUBTRACT = 0x6D
    DECIMAL = 0x6E
    DIVIDE = 0x6F
    F1 = 0x70
    F2 = 0x71
    F3 = 0x72
    F4 = 0x73
    F5 = 0x74
    F6 = 0x75
    F7 = 0x76
    F8 = 0x77
    F9 = 0x78
    F10 = 0x79
    F11 = 0x7A
    F12 = 0x7B
    F13 = 0x7C
    F14 = 0x7D
    F15 = 0x7E
    F16 = 0x7F
    F17 = 0x80
    F18 = 0x81
    F19 = 0x82
    F20 = 0x83
    F21 = 0x84
    F22 = 0x85
    F23 = 0x86
    F24 = 0x87
    NUMLOCK = 0x90
    SCROLL = 0x91
    LSHIFT = 0xA0
    RSHIFT = 0xA1
    LCONTROL = 0xA2
    RCONTROL = 0xA3
    LMENU = 0xA4
    RMENU = 0xA5
    OEM_1 = 0xBA
    OEM_PLUS = 0xBB
    OEM_COMMA = 0xBC
    OEM_MINUS = 0xBD
    OEM_PERIOD = 0xBE
    OEM_2 = 0xBF
    OEM_3 = 0xC0
    OEM_4 = 0xDB
    OEM_5 = 0xDC
    OEM_6 = 0xDD
    OEM_7 = 0xDE
    OEM_8 = 0xDF
    ICO_F17 = 0xE0
    ICO_F18 = 0xE1
    OEM102 = 0xE2
    ICO_HELP = 0xE3
    ICO_00 = 0xE4
    ICO_CLEAR = 0xE6
    OEM_RESET = 0xE9
    OEM_JUMP = 0xEA
    OEM_PA1 = 0xEB
    OEM_PA2 = 0xEC
    OEM_PA3 = 0xED
    OEM_WSCTRL = 0xEE
    OEM_CUSEL = 0xEF
    OEM_ATTN = 0xF0
    OEM_FINNISH = 0xF1
    OEM_COPY = 0xF2
    OEM_AUTO = 0xF3
    OEM_ENLW = 0xF4
    OEM_BACKTAB = 0xF5
    ATTN = 0xF6
    CRSEL = 0xF7
    EXSEL = 0xF8
    EREOF = 0xF9
    PLAY = 0xFA
    ZOOM = 0xFB
    NONAME = 0xFC
    PA1 = 0xFD
    OEM_CLEAR = 0xFE
  end
end
#-------------------------------------------------------------------------------
end
#===============================================================================

#===============================================================================
if !$NEKO_RUBY.nil?
#-------------------------------------------------------------------------------
module Input

  KeyMaps = {
    
    :NULL => -1,

    ## RGSS default key
    # https://www.rubydoc.info/github/cstrahan/open-rpg-maker/Input
    
    :DOWN => [SDL::Key::DOWN, SDL::Key::S],
    :LEFT => [SDL::Key::LEFT, SDL::Key::A],
    :RIGHT => [SDL::Key::RIGHT, SDL::Key::D],
    :UP => [SDL::Key::UP, SDL::Key::W],
    :A => [SDL::Key::LSHIFT],
    :B => [SDL::Key::X, SDL::Key::ESCAPE],
    :C => [SDL::Key::Z, SDL::Key::RETURN],
    :X => [SDL::Key::A],
    :Y => [SDL::Key::D],
    :Z => [SDL::Key::S],
    :L => [SDL::Key::PAGEUP],
    :R => [SDL::Key::PAGEDOWN],
    :SHIFT => [SDL::Key::LSHIFT, SDL::Key::RSHIFT],
    :CTRL => [SDL::Key::LCTRL, SDL::Key::RCTRL],
    :ALT => [SDL::Key::LALT, SDL::Key::RALT],
    :F5 => [SDL::Key::F5],
    :F6 => [SDL::Key::F6],
    :F7 => [SDL::Key::F7],
    :F8 => [SDL::Key::F8],
    :F9 => [SDL::Key::F9],
    :SHOW_FPS => [SDL::Key::F2],
    :RESET => [SDL::Key::F12],

    ## keyboard
    :KB_ESCAPE => SDL::Key::ESCAPE,
    :KB_F1 => SDL::Key::F1,
    :KB_F2 => SDL::Key::F2,
    :KB_F3 => SDL::Key::F3,
    :KB_F4 => SDL::Key::F4,
    :KB_F5 => SDL::Key::F5,
    :KB_F6 => SDL::Key::F6,
    :KB_F7 => SDL::Key::F7,
    :KB_F8 => SDL::Key::F8,
    :KB_F9 => SDL::Key::F9,
    :KB_F10 => SDL::Key::F10,
    :KB_F11 => SDL::Key::F11,
    :KB_F12 => SDL::Key::F12,
    :KB_F13 => SDL::Key::F13,
    :KB_F14 => SDL::Key::F14,
    :KB_F15 => SDL::Key::F15,
    
    :KB_0 => SDL::Key::K0,
    :KB_1 => SDL::Key::K1,
    :KB_2 => SDL::Key::K2,
    :KB_3 => SDL::Key::K3,
    :KB_4 => SDL::Key::K4,
    :KB_5 => SDL::Key::K5,
    :KB_6 => SDL::Key::K6,
    :KB_7 => SDL::Key::K7,
    :KB_8 => SDL::Key::K8,
    :KB_9 => SDL::Key::K9,
    
    :KB_TILDE => SDL::Key::GRAVE,
    :KB_TAB => SDL::Key::TAB,
    :KB_CAPSLOCK => SDL::Key::CAPSLOCK,
    :KB_LSHIFT => SDL::Key::LSHIFT,
    :KB_LCTRL => SDL::Key::LCTRL,
    :KB_LALT => SDL::Key::LALT,
    :KB_BACKSPACE => SDL::Key::BACKSPACE,
    :KB_ENTER => SDL::Key::RETURN,
    :KB_RSHIFT => SDL::Key::RSHIFT,
    :KB_RALT => SDL::Key::RALT,
    :KB_RCTRL => SDL::Key::RCTRL,
    
    :KB_MINUS => SDL::Key::MINUS,
    :KB_EQUALS => SDL::Key::EQUALS,
    :KB_BACKSLASH => SDL::Key::BACKSLASH,
    :KB_LEFTBRACKET => SDL::Key::LEFTBRACKET,
    :KB_RIGHTBRACKET => SDL::Key::RIGHTBRACKET,
    :KB_SEMICOLON => SDL::Key::SEMICOLON,
    :KB_APOSTROPHE => SDL::Key::APOSTROPHE,
    :KB_COMMA => SDL::Key::COMMA,
    :KB_PERIOD => SDL::Key::PERIOD,
    :KB_SLASH => SDL::Key::SLASH,
    :KB_SPACE => SDL::Key::SPACE,
    
    :KB_A => SDL::Key::A,
    :KB_B => SDL::Key::B,
    :KB_C => SDL::Key::C,
    :KB_D => SDL::Key::D,
    :KB_E => SDL::Key::E,
    :KB_F => SDL::Key::F,
    :KB_G => SDL::Key::G,
    :KB_H => SDL::Key::H,
    :KB_I => SDL::Key::I,
    :KB_J => SDL::Key::J,
    :KB_K => SDL::Key::K,
    :KB_L => SDL::Key::L,
    :KB_M => SDL::Key::M,
    :KB_N => SDL::Key::N,
    :KB_O => SDL::Key::O,
    :KB_P => SDL::Key::P,
    :KB_Q => SDL::Key::Q,
    :KB_R => SDL::Key::R,
    :KB_S => SDL::Key::S,
    :KB_T => SDL::Key::T,
    :KB_U => SDL::Key::U,
    :KB_V => SDL::Key::V,
    :KB_W => SDL::Key::W,
    :KB_X => SDL::Key::X,
    :KB_Y => SDL::Key::Y,
    :KB_Z => SDL::Key::Z,
    
    :KB_PRINTSCREEN => SDL::Key::PRINTSCREEN, # VK_SNAPSHOT = 0x2C
    :KB_SCROLLLOCK => SDL::Key::SCROLLLOCK, # VK_SCROLL = 0x91
    :KB_PAUSEBREAK => SDL::Key::PAUSEBREAK, # VK_PAUSE = 0x13
    :KB_INSERT => SDL::Key::INSERT, # VK_INSERT = 0x2D
    :KB_HOME => SDL::Key::HOME, # VK_HOME = 0x24
    :KB_PAGEUP => SDL::Key::PAGEUP,
    :KB_DELETE => SDL::Key::DELETE,
    :KB_END => SDL::Key::END,
    :KB_PAGEDOWN => SDL::Key::PAGEDOWN,
    :KB_UP => SDL::Key::UP,
    :KB_LEFT => SDL::Key::LEFT,
    :KB_DOWN => SDL::Key::DOWN,
    :KB_RIGHT => SDL::Key::RIGHT,
    
    # KEYPAD
    :KB_KEYPAD_0 => SDL::Key::KP0,
    :KB_KEYPAD_1 => SDL::Key::KP1,
    :KB_KEYPAD_2 => SDL::Key::KP2,
    :KB_KEYPAD_3 => SDL::Key::KP3,
    :KB_KEYPAD_4 => SDL::Key::KP4,
    :KB_KEYPAD_5 => SDL::Key::KP5,
    :KB_KEYPAD_6 => SDL::Key::KP6,
    :KB_KEYPAD_7 => SDL::Key::KP7,
    :KB_KEYPAD_8 => SDL::Key::KP8,
    :KB_KEYPAD_9 => SDL::Key::KP9,
    :KB_NUMLOCK => SDL::Key::NUMLOCK,
    :KB_KEYPAD_DIVIDE => SDL::Key::KP_DIVIDE,
    :KB_KEYPAD_MULTIPLY => SDL::Key::KP_MULTIPLY,
    :KB_KEYPAD_MINUS => SDL::Key::KP_MINUS,
    :KB_KEYPAD_PLUS => SDL::Key::KP_PLUS,
    :KB_KEYPAD_ENTER => SDL::Key::KP_ENTER,
    :KB_KEYPAD_PERIOD => SDL::Key::KP_PERIOD,
  }

  # Entities[sdl_key_value] = universal_key_sym
  Entities = {}

  KeyMaps.each do |universal_key_sym, sdl_key_value|
    const_set(universal_key_sym, universal_key_sym)
    if sdl_key_value.is_a?(Array)
      sdl_key_value.each do |value|
        Entities[value] ||= []
        Entities[value].push(universal_key_sym)
      end
    elsif sdl_key_value.is_a?(Numeric)
      Entities[sdl_key_value] ||= []
      Entities[sdl_key_value].push(universal_key_sym)
    else
      raise "Invalid key type"
    end
  end

  @status = {}
  @events = []

  class << self
    
    attr_accessor(:events)

    def _update

    end

    def update
      for k, v in @status
        @status[k] = v + 1
      end
      while e = @events.shift
        univeral_key_syms = Entities[e.sym]
        break if univeral_key_syms.nil?
        univeral_key_syms.each do |key_sym|
          next if e.repeat > 0
          type = e.class
          if type == SDL::Event::KeyDown
            case key_sym
            when :SHOW_FPS
              RGSS.show_fps = !RGSS.show_fps
            when :RESET
              raise RGSSReset
            else
              @status[key_sym] = 0
            end
          elsif type == SDL::Event::KeyUp
            @status.delete(key_sym)
          end
        end
      end
    end

    def _press?(sym)
      return press?(sym)
    end

    def press?(sym)
      return !@status[sym].nil?
    end

    undef _trigger?
    def trigger?(sym)
      return !@status[sym].nil? && @status[sym] == 0
    end

    undef _repeat?
    def repeat?(sym)
      return !@status[sym].nil? && (@status[sym] == 0 || (@status[sym] > 10 && @status[sym] % 4 == 0))
    end

    undef _status
    def status(sym)
      return @status[sym]
    end

    def dir4
      case
      when status(:DOWN)
        2
      when status(:LEFT)
        4
      when status(:RIGHT)
        6
      when status(:UP)
        8
      else
        0
      end
    end

    def dir8
      case
      when status(:DOWN) && status(:LEFT)
        1
      when status(:DOWN) && status(:RIGHT)
        3
      when status(:DOWN)
        2
      when status(:UP) && status(:LEFT)
        7
      when status(:UP) && status(:RIGHT)
        9
      when status(:UP)
        8
      when status(:LEFT)
        4
      when status(:RIGHT)
        6
      else
        0
      end
    end

  end
end
#-------------------------------------------------------------------------------
end
#===============================================================================

#===============================================================================
if $NEKO_RUBY.nil?
#-------------------------------------------------------------------------------  
module Input

  KeyMaps = {
    
    :NULL => -1,

    ## keyboard
    :KB_ESCAPE => Virtual::Key::ESCAPE,
    :KB_F1 => Virtual::Key::F1,
    :KB_F2 => Virtual::Key::F2,
    :KB_F3 => Virtual::Key::F3,
    :KB_F4 => Virtual::Key::F4,
    :KB_F5 => Virtual::Key::F5,
    :KB_F6 => Virtual::Key::F6,
    :KB_F7 => Virtual::Key::F7,
    :KB_F8 => Virtual::Key::F8,
    :KB_F9 => Virtual::Key::F9,
    :KB_F10 => Virtual::Key::F10,
    :KB_F11 => Virtual::Key::F11,
    :KB_F12 => Virtual::Key::F12,
    :KB_F13 => Virtual::Key::F13,
    :KB_F14 => Virtual::Key::F14,
    :KB_F15 => Virtual::Key::F15,
    
    :KB_0 => Virtual::Key::K0,
    :KB_1 => Virtual::Key::K1,
    :KB_2 => Virtual::Key::K2,
    :KB_3 => Virtual::Key::K3,
    :KB_4 => Virtual::Key::K4,
    :KB_5 => Virtual::Key::K5,
    :KB_6 => Virtual::Key::K6,
    :KB_7 => Virtual::Key::K7,
    :KB_8 => Virtual::Key::K8,
    :KB_9 => Virtual::Key::K9,
    
    :KB_TILDE => Virtual::Key::OEM_3,
    :KB_TAB => Virtual::Key::TAB,
    :KB_CAPSLOCK => Virtual::Key::CAPITAL,
    :KB_LSHIFT => Virtual::Key::LSHIFT,
    :KB_LCTRL => Virtual::Key::LCONTROL,
    :KB_LALT => Virtual::Key::LMENU,
    :KB_BACKSPACE => Virtual::Key::BACK,
    :KB_ENTER => Virtual::Key::RETURN,
    :KB_RSHIFT => Virtual::Key::RSHIFT,
    :KB_RALT => Virtual::Key::RMENU,
    :KB_RCTRL => Virtual::Key::RCONTROL,
    
    :KB_MINUS => Virtual::Key::OEM_MINUS,
    :KB_EQUALS => Virtual::Key::OEM_PLUS,
    :KB_BACKSLASH => Virtual::Key::OEM_5,
    :KB_LEFTBRACKET => Virtual::Key::OEM_4,
    :KB_RIGHTBRACKET => Virtual::Key::OEM_6,
    :KB_SEMICOLON => Virtual::Key::OEM_1,
    :KB_APOSTROPHE => Virtual::Key::OEM_7,
    :KB_COMMA => Virtual::Key::OEM_COMMA,
    :KB_PERIOD => Virtual::Key::OEM_PERIOD,
    :KB_SLASH => Virtual::Key::OEM_2,
    :KB_SPACE => Virtual::Key::SPACE,
    
    :KB_A => Virtual::Key::A,
    :KB_B => Virtual::Key::B,
    :KB_C => Virtual::Key::C,
    :KB_D => Virtual::Key::D,
    :KB_E => Virtual::Key::E,
    :KB_F => Virtual::Key::F,
    :KB_G => Virtual::Key::G,
    :KB_H => Virtual::Key::H,
    :KB_I => Virtual::Key::I,
    :KB_J => Virtual::Key::J,
    :KB_K => Virtual::Key::K,
    :KB_L => Virtual::Key::L,
    :KB_M => Virtual::Key::M,
    :KB_N => Virtual::Key::N,
    :KB_O => Virtual::Key::O,
    :KB_P => Virtual::Key::P,
    :KB_Q => Virtual::Key::Q,
    :KB_R => Virtual::Key::R,
    :KB_S => Virtual::Key::S,
    :KB_T => Virtual::Key::T,
    :KB_U => Virtual::Key::U,
    :KB_V => Virtual::Key::V,
    :KB_W => Virtual::Key::W,
    :KB_X => Virtual::Key::X,
    :KB_Y => Virtual::Key::Y,
    :KB_Z => Virtual::Key::Z,
    
    :KB_PRINTSCREEN => Virtual::Key::SNAPSHOT,
    :KB_SCROLLLOCK => Virtual::Key::SCROLL,
    :KB_PAUSEBREAK => Virtual::Key::PAUSE,
    :KB_INSERT => Virtual::Key::INSERT,
    :KB_HOME => Virtual::Key::HOME,
    :KB_PAGEUP => Virtual::Key::PRIOR,
    :KB_DELETE => Virtual::Key::DELETE,
    :KB_END => Virtual::Key::END,
    :KB_PAGEDOWN => Virtual::Key::NEXT,
    :KB_UP => Virtual::Key::UP,
    :KB_LEFT => Virtual::Key::LEFT,
    :KB_DOWN => Virtual::Key::DOWN,
    :KB_RIGHT => Virtual::Key::RIGHT,
    
    # KEYPAD
    :KB_KEYPAD_0 => Virtual::Key::NUMPAD0,
    :KB_KEYPAD_1 => Virtual::Key::NUMPAD1,
    :KB_KEYPAD_2 => Virtual::Key::NUMPAD2,
    :KB_KEYPAD_3 => Virtual::Key::NUMPAD3,
    :KB_KEYPAD_4 => Virtual::Key::NUMPAD4,
    :KB_KEYPAD_5 => Virtual::Key::NUMPAD5,
    :KB_KEYPAD_6 => Virtual::Key::NUMPAD6,
    :KB_KEYPAD_7 => Virtual::Key::NUMPAD7,
    :KB_KEYPAD_8 => Virtual::Key::NUMPAD8,
    :KB_KEYPAD_9 => Virtual::Key::NUMPAD9,
    :KB_NUMLOCK => Virtual::Key::NUMLOCK,
    :KB_KEYPAD_DIVIDE => Virtual::Key::DIVIDE,
    :KB_KEYPAD_MULTIPLY => Virtual::Key::MULTIPLY,
    :KB_KEYPAD_MINUS => Virtual::Key::SUBTRACT,
    :KB_KEYPAD_PLUS => Virtual::Key::ADD,
    :KB_KEYPAD_ENTER => Virtual::Key::RETURN, # => KB_ENTER
    :KB_KEYPAD_PERIOD => Virtual::Key::DECIMAL,
  }

  KeyMaps.each do |universal_key_sym, sdl_key_value|
    const_set(universal_key_sym, universal_key_sym)
  end

  @key_states = Array.new(255, 0)

  class << self

    GetKeyState = Win32API.new('user32', 'GetAsyncKeyState', 'i', 'i')
    REPEAT_DELAY1 = Graphics.frame_rate / 2
    REPEAT_DELAY2 = Graphics.frame_rate / 10

    alias_method(:default_update, :update)
    alias_method(:default_press?, :press?)
    alias_method(:default_trigger?, :trigger?)
    alias_method(:default_repeat?, :repeat?)

    def update
      symbol_update
      default_update
    end

    def press?(num_or_sym)
      if num_or_sym.is_a?(Numeric)
        return default_press?(num_or_sym)
      elsif num_or_sym.is_a?(Symbol)
        return symbol_press?(KeyMaps[num_or_sym])
      end
      raise "press invalid key type."
    end
    
    def trigger?(num_or_sym)
      if num_or_sym.is_a?(Numeric)
        return default_trigger?(num_or_sym)
      elsif num_or_sym.is_a?(Symbol)
        return symbol_trigger?(KeyMaps[num_or_sym])
      end
      raise "trigger invalid key type."
    end
    
    def repeat?(num_or_sym)
      if num_or_sym.is_a?(Numeric)
        return default_repeat?(num_or_sym)
      elsif num_or_sym.is_a?(Symbol)
        return symbol_repeat?(KeyMaps[num_or_sym])
      end
      raise "repeat invalid key type."
    end

    def symbol_update
      for i in 0..255
        if symbol_press?(i)
          if @key_states[i] == 0
            @key_states[i] = 1
          else
            @key_states[i] = [@key_states[i] + 1, 2].max
          end
        else
          @key_states[i] = 0
        end
      end
    end

    def symbol_press?(key)
      return GetKeyState.call(key) != 0
    end

    def symbol_trigger?(key)
      return @key_states[key] == 1
    end

    def symbol_repeat?(key)
      return symbol_trigger?(key) || (@key_states[key] >= REPEAT_DELAY1 && @key_states[key] % REPEAT_DELAY2 == 0)
    end

  end
end
#-------------------------------------------------------------------------------
end
#===============================================================================

#===============================================================================
if !$NEKO_RUBY.nil?
#-------------------------------------------------------------------------------
module RPG::Cache
  def self.neko_control(filename)
    raise "컨트롤 그래픽 경로를 설정하지 않았습니다." if filename == ""
    begin
      self.load_bitmap("Graphics/Nekocontrols/", filename)
    rescue Exception => e
      raise "컨트롤 그래픽이 존재하지 않습니다.\n\n#{e.message}"
    end
  end
end
#-------------------------------------------------------------------------------
end
#===============================================================================

#===============================================================================
if !$NEKO_RUBY.nil?
#-------------------------------------------------------------------------------
module NekoControllerManager

  module TouchType
    DOWN = 0x0
    UP   = 0x1
    DRAG = 0x2
  end

  module ENV
    MAGNIFICATION = SDL.getenv("DPAD_SCALE").to_f
    SDL.putenv("DPAD_SCALE=0.0")
    OPACITY = SDL.getenv("DPAD_OPACITY").to_i
    sdl_key = {4 => SDL::Key::A, 22 => SDL::Key::S, 40 => SDL::Key::RETURN, 41 => SDL::Key::ESCAPE, 225 => SDL::Key::LSHIFT}
    KEY_1 = sdl_key[SDL.getenv("KEY_1").to_i]
    KEY_2 = sdl_key[SDL.getenv("KEY_2").to_i]
    KEY_3 = sdl_key[SDL.getenv("KEY_3").to_i]
    KEY_4 = sdl_key[SDL.getenv("KEY_4").to_i]
    SURFACE = Hash.new
    filelist = ["dpad_none", "dpad_down", "dpad_left", "dpad_right", "dpad_up", "dpad_stick", "UltimateDroidButton1", "UltimateDroidButton1Pressed", "UltimateDroidButton2", "UltimateDroidButton2Pressed", "UltimateDroidButton3", "UltimateDroidButton3Pressed", "UltimateDroidButton4", "UltimateDroidButton4Pressed"]
    for filename in filelist
      key = filename.to_sym
      SURFACE[key] = SDL::Surface.load(filename + ".png")
      SURFACE[key].setColorKey(SURFACE[key].mapRGBA(0, 0, 0, 0))
    end
  end

  DEVICE_WIDTH = 0
  DEVICE_HEIGHT = 0
  SCREEN_WIDTH = 0
  SCREEN_HEIGHT = 0

  @@entity = nil
  @@last_target_control = nil
  @@last_finger_id = 0

  DIR_NAME = "Graphics/Nekocontrols"
  Dir.mkdir(DIR_NAME) if !FileTest.exist?(DIR_NAME) || !FileTest.directory?(DIR_NAME)

  def self.entity
    return @@entity
  end

  def self.entity=(controller)
    raise "올바른 형식의 컨트롤러가 아닙니다." if controller.nil?
    raise "컨트롤러에 viewport가 없습니다." if controller.viewport.nil?
    if !@@entity.nil?
      @@entity.visible = false
    end
    @@entity = controller
    @@entity.visible = true
  end

  def self.recalculate_resolution_value
    self.const_set(:DEVICE_WIDTH, SDL.getenv("SCREEN_WIDTH").to_i)
    self.const_set(:DEVICE_HEIGHT, SDL.getenv("SCREEN_HEIGHT").to_i)
    self.const_set(:SCREEN_WIDTH, Graphics.width)
    self.const_set(:SCREEN_HEIGHT, Graphics.height)
    @ratio_height = DEVICE_HEIGHT / SCREEN_HEIGHT.to_f
    @new_width = SCREEN_WIDTH * @ratio_height
    @remain_width = (DEVICE_WIDTH - @new_width) / 2
    @ratio_width = DEVICE_WIDTH / @new_width
    @ratio_remain_width = @remain_width / DEVICE_WIDTH.to_f
    @new_width2 = SCREEN_WIDTH * @ratio_width
    if !@@entity.nil?
      controller.viewport.width = SCREEN_WIDTH
      controller.viewport.height = SCREEN_HEIGHT
    end
  end

  def self.get_target_control(touch_x, touch_y)
    detected_controls = []
    @@entity.controls.container.each do |control|
      next if !control.sprite.visible
      next if 0 == control.opacity
      next if !control.is_range?(touch_x, touch_y)
      next if !control.rect_touchable && 0 == ((control.get_pixel(touch_x, touch_y) >> 24) & 0xFF)
      detected_controls.push(control)
    end
    return detected_controls.max do |a, b|
        if a.z == b.z
          a.created_at <=> b.created_at
        else
          a.z <=> b.z
        end
      end
  end

  def self.listen(finger_id, unit_x, unit_y, type)
    x = ((unit_x - @ratio_remain_width) * @new_width2).to_i
    y = (unit_y * SCREEN_HEIGHT).to_i
    target_control = get_target_control(x, y)
    if !@@last_target_control.nil? && @@last_target_control != target_control && @@last_finger_id == finger_id
      if @@last_target_control.first_pressed
        @@last_target_control.event_touch_over(finger_id, x, y, type)
      end
    end
    @@last_target_control = target_control
    @@last_finger_id = finger_id
    return if target_control.nil?
    target_control.event_touch_in(finger_id, x, y, type)
  end

  def self.send_event(event, key, press)
    e = event.new
    e.press = press
    e.repeat = 0
    e.mod = 0
    e.sym = key
    Input.events << e
  end

  def self.get_bitmap(bitmap_or_path)
    if bitmap_or_path.is_a?(Bitmap)
      return bitmap_or_path
    elsif bitmap_or_path.is_a?(String)
      return Bitmap.new(bitmap_or_path)
    end
    raise LoadError
  end

  def self.create_resized_bitmap(src_bitmap, width, height)
    b = Bitmap.new(width, height)
    b.stretch_blt(Rect.new(0, 0, width, height), src_bitmap, src_bitmap.rect)
    return b
  end

  def self.create_resized_default_bitmap(surface, width, height)
    b = Bitmap.new(width, height)
    SDL::Surface.stretchBlit(surface, [0, 0, surface.w, surface.h], b.entity, [0, 0, width, height])
    return b
  end
end

NekoControllerManager.recalculate_resolution_value

#-------------------------------------------------------------------------------
end
#===============================================================================

#===============================================================================
if !$NEKO_RUBY.nil?
#-------------------------------------------------------------------------------
class NekoControlContainer

  attr_reader(:container)

  def initialize
    @container = []
  end

  def add(control)
    control.sprite.visible = control.visible
    control.sprite_stick.visible = control.visible if defined? control.sprite_stick
    @container.push(control)
  end

  def remove(control)
    control.sprite.visible = false
    control.sprite_stick.visible = false if defined? control.sprite_stick
    @container.delete(control)
  end

  def clear
    for control in @container
      control.sprite.visible = false
      control.sprite_stick.visible = false if defined? control.sprite_stick
    end
    @container.clear
  end
end
#-------------------------------------------------------------------------------
end
#===============================================================================

#===============================================================================
if !$NEKO_RUBY.nil?
#-------------------------------------------------------------------------------
class NekoControl_Interface

  attr_reader(:sprite)
  attr_reader(:key)
  attr_reader(:x)
  attr_reader(:y)
  attr_reader(:z)
  attr_reader(:width)
  attr_reader(:height)
  attr_reader(:opacity)
  attr_reader(:visible)
  attr_accessor(:rect_touchable)
  attr_reader(:created_at)
  attr_accessor(:first_pressed)

  def initialize(key, x, y, z, width, height, viewport)
    raise "컨트롤러에 viewport가 설정되지 않았습니다." if viewport == nil
    @key = (key.is_a?(Symbol) ? Input::KeyMaps[key] : key)
    @sprite = Sprite.new(viewport)
    @sprite.x = @x = x
    @sprite.y = @y = y
    @sprite.z = @z = z
    @width = width
    @height = height
    @sprite.opacity = @opacity = 255
    @sprite.visible = false
    @visible = true
    @rect_touchable = true
    @created_at = SDL.getTicks()
    @first_pressed = false
  end

  def x=(value)
    @x = @sprite.x = value
  end

  def y=(value)
    @y = @sprite.y = value
  end

  def z=(value)
    @z = @sprite.z = value
  end

  def opacity=(value)
    @opacity = @sprite.opacity = value
  end

  def visible=(value)
    @visible = @sprite.visible = value
  end

  def resize(width, height)
    @width = width
    @height = height
  end

  def is_range?(touch_x, touch_y)
    return touch_x >= @sprite.x && touch_x < @sprite.x + @width && touch_y >= @sprite.y && touch_y < @sprite.y + @height
  end

  def get_pixel(touch_x, touch_y)
    return @sprite.bitmap.entity.getPixel(touch_x - @sprite.x, touch_y - @sprite.y)
  end

  def event_touch_over(finger_id, x, y, type)
    @first_pressed = false
  end

  def event_touch_in(finger_id, x, y, type)

  end
end
#-------------------------------------------------------------------------------
end
#===============================================================================

#===============================================================================
if !$NEKO_RUBY.nil?
#-------------------------------------------------------------------------------
class NekoControl_Direction4 < NekoControl_Interface

  attr_reader(:sprite_stick)
  attr_reader(:bitmap_default)
  attr_reader(:bitmap_down)
  attr_reader(:bitmap_left)
  attr_reader(:bitmap_right)
  attr_reader(:bitmap_up)
  attr_reader(:bitmap_stick)
  attr_reader(:bitmap_resized_default)
  attr_reader(:bitmap_resized_down)
  attr_reader(:bitmap_resized_left)
  attr_reader(:bitmap_resized_right)
  attr_reader(:bitmap_resized_up)
  attr_reader(:bitmap_resized_stick)
  attr_reader(:stick_movable_radius)

  def initialize(x, y, z, width, height, viewport)
    super(nil, x, y, z, width, height, viewport)
    @stick_movable_radius = 0
    @sprite_stick = Sprite.new(viewport)
    @sprite_stick.z = @z + 1
    @sprite_stick.visible = false
    @stick_center_x = 0
    @stick_center_y = 0
  end

  def x=(value)
    super(value)
    @stick_center_x = @x + @sprite_stick.ox
    @sprite_stick.x = @stick_center_x
  end

  def y=(value)
    super(value)
    @stick_center_y = @y + @sprite_stick.oy
    @sprite_stick.y = @stick_center_y
  end

  def z=(value)
    super(value)
    @sprite_stick.z = @z + 1
  end

  def opacity=(value)
    super(value)
    @sprite_stick.opacity = @opacity
  end

  def visible=(value)
    super(value)
    @sprite_stick.visible = @visible
  end

  def stick_movable_radius=(value)
    value = 0 if value < 0
    @stick_movable_radius = value
  end

  def resize(width, height)
    super(width, height)
    if @bitmap_default.nil?
      @bitmap_resized_default = NekoControllerManager.create_resized_default_bitmap(NekoControllerManager::ENV::SURFACE[:dpad_none], @width, @height)
    else
      @bitmap_resized_default = NekoControllerManager.create_resized_bitmap(@bitmap_default, @width, @height)
    end
    if @bitmap_down.nil?
      @bitmap_resized_down = NekoControllerManager.create_resized_default_bitmap(NekoControllerManager::ENV::SURFACE[:dpad_down], @width, @height)
    else
      @bitmap_resized_down = NekoControllerManager.create_resized_bitmap(@bitmap_down, @width, @height)
    end
    if @bitmap_left.nil?
      @bitmap_resized_left = NekoControllerManager.create_resized_default_bitmap(NekoControllerManager::ENV::SURFACE[:dpad_left], @width, @height)
    else
      @bitmap_resized_left = NekoControllerManager.create_resized_bitmap(@bitmap_left, @width, @height)
    end
    if @bitmap_right.nil?
      @bitmap_resized_right = NekoControllerManager.create_resized_default_bitmap(NekoControllerManager::ENV::SURFACE[:dpad_right], @width, @height)
    else
      @bitmap_resized_right = NekoControllerManager.create_resized_bitmap(@bitmap_right, @width, @height)
    end
    if @bitmap_up.nil?
      @bitmap_resized_up = NekoControllerManager.create_resized_default_bitmap(NekoControllerManager::ENV::SURFACE[:dpad_up], @width, @height)
    else
      @bitmap_resized_up = NekoControllerManager.create_resized_bitmap(@bitmap_up, @width, @height)
    end
    if @bitmap_stick.nil?
      @bitmap_resized_stick = NekoControllerManager.create_resized_default_bitmap(NekoControllerManager::ENV::SURFACE[:dpad_stick], @width, @height)
    else
      @bitmap_resized_stick = NekoControllerManager.create_resized_bitmap(@bitmap_stick, @width, @height)
    end
    @sprite.bitmap = @bitmap_resized_default
    @sprite_stick.bitmap = @bitmap_resized_stick
    @sprite_stick.ox = @width / 2
    @sprite_stick.oy = @height / 2
    @stick_center_x = @sprite.x + @sprite_stick.ox
    @stick_center_y = @sprite.y + @sprite_stick.oy
    @sprite_stick.x = @stick_center_x
    @sprite_stick.y = @stick_center_y
  end

  def set_image_default(bitmap_or_path)
    if bitmap_or_path.nil?
      @bitmap_default = nil
      @bitmap_resized_default = NekoControllerManager.create_resized_default_bitmap(NekoControllerManager::ENV::SURFACE[:dpad_none], @width, @height)
    else
      @bitmap_default = NekoControllerManager.get_bitmap(bitmap_or_path)
      @bitmap_resized_default = NekoControllerManager.create_resized_bitmap(@bitmap_default, @width, @height)
    end
    @sprite.bitmap = @bitmap_resized_default
  end

  def set_image_down(bitmap_or_path)
    if bitmap_or_path.nil?
      @bitmap_down = nil
      @bitmap_resized_down = NekoControllerManager.create_resized_default_bitmap(NekoControllerManager::ENV::SURFACE[:dpad_down], @width, @height)
    else
      @bitmap_down = NekoControllerManager.get_bitmap(bitmap_or_path)
      @bitmap_resized_down = NekoControllerManager.create_resized_bitmap(@bitmap_down, @width, @height)
    end
  end

  def set_image_left(bitmap_or_path)
    if bitmap_or_path.nil?
      @bitmap_left = nil
      @bitmap_resized_left = NekoControllerManager.create_resized_default_bitmap(NekoControllerManager::ENV::SURFACE[:dpad_left], @width, @height)
    else
      @bitmap_left = NekoControllerManager.get_bitmap(bitmap_or_path)
      @bitmap_resized_left = NekoControllerManager.create_resized_bitmap(@bitmap_left, @width, @height)
    end
  end

  def set_image_right(bitmap_or_path)
    if bitmap_or_path.nil?
      @bitmap_right = nil
      @bitmap_resized_right = NekoControllerManager.create_resized_default_bitmap(NekoControllerManager::ENV::SURFACE[:dpad_right], @width, @height)
    else
      @bitmap_right = NekoControllerManager.get_bitmap(bitmap_or_path)
      @bitmap_resized_right = NekoControllerManager.create_resized_bitmap(@bitmap_right, @width, @height)
    end
  end

  def set_image_up(bitmap_or_path)
    if bitmap_or_path.nil?
      @bitmap_up = nil
      @bitmap_resized_up = NekoControllerManager.create_resized_default_bitmap(NekoControllerManager::ENV::SURFACE[:dpad_up], @width, @height)
    else
      @bitmap_up = NekoControllerManager.get_bitmap(bitmap_or_path)
      @bitmap_resized_up = NekoControllerManager.create_resized_bitmap(@bitmap_up, @width, @height)
    end
  end

  def set_image_stick(bitmap_or_path)
    if bitmap_or_path.nil?
      @bitmap_stick = nil
      @bitmap_resized_stick = NekoControllerManager.create_resized_default_bitmap(NekoControllerManager::ENV::SURFACE[:dpad_stick], @width, @height)
    else
      @bitmap_stick = NekoControllerManager.get_bitmap(bitmap_or_path)
      @bitmap_resized_stick = NekoControllerManager.create_resized_bitmap(@bitmap_stick, @width, @height)
    end
    @sprite_stick.bitmap = @bitmap_resized_stick
    @sprite_stick.ox = @width / 2
    @sprite_stick.oy = @height / 2
    @stick_center_x = @sprite.x + @sprite_stick.ox
    @stick_center_y = @sprite.y + @sprite_stick.oy
    @sprite_stick.x = @stick_center_x
    @sprite_stick.y = @stick_center_y
  end

  def move_stick(touch_x, touch_y)
    dx = @stick_center_x - touch_x
    dy = @stick_center_y - touch_y
    dist2 = dx * dx + dy * dy
    r = @stick_movable_radius
    if dist2 < r * r
      @sprite_stick.x = touch_x
      @sprite_stick.y = touch_y
    else
      angle = Math.atan2(dy, dx) + Math::PI
      @sprite_stick.x = @stick_center_x + r * Math.cos(angle)
      @sprite_stick.y = @stick_center_y + r * Math.sin(angle)
    end
  end

  def event_touch_over(finger_id, x, y, type)
    super(finger_id, x, y, type)
    @sprite.bitmap = @bitmap_resized_default
    @sprite_stick.x = @stick_center_x
    @sprite_stick.y = @stick_center_y
    NekoControllerManager.send_event(SDL::Event::KeyUp, @key, false)
    @key = nil
  end

  def event_touch_in(finger_id, x, y, type)
    case type
    when NekoControllerManager::TouchType::DOWN, NekoControllerManager::TouchType::DRAG
      @first_pressed = true
      dx = @sprite.x + @width / 2 - x
      dy = @sprite.y + @height / 2 - y
      angle = Math.atan2(dy, dx) * (180 / Math::PI)
      case angle
      when (-135.0...-45.0)
        @sprite.bitmap = @bitmap_resized_down
        sdl_key = SDL::Key::DOWN

      when (-45.0...45.0)
        @sprite.bitmap = @bitmap_resized_left
        sdl_key = SDL::Key::LEFT

      when (-180.0...-135.0), (135.0...180.0)
        @sprite.bitmap = @bitmap_resized_right
        sdl_key = SDL::Key::RIGHT

      when (45.0...135.0)
        @sprite.bitmap = @bitmap_resized_up
        sdl_key = SDL::Key::UP
      end
      if @key != sdl_key
        NekoControllerManager.send_event(SDL::Event::KeyUp, @key, false) if !@key.nil?
        @key = sdl_key
        NekoControllerManager.send_event(SDL::Event::KeyDown, @key, true)
      end
      move_stick(x, y) if @sprite_stick.visible && @sprite_stick.opacity > 0 && @stick_movable_radius > 0

    when NekoControllerManager::TouchType::UP
      @first_pressed = false
      @sprite.bitmap = @bitmap_resized_default
      @sprite_stick.x = @stick_center_x
      @sprite_stick.y = @stick_center_y
      NekoControllerManager.send_event(SDL::Event::KeyUp, @key, false)
      @key = nil
      
    end
  end
end
#-------------------------------------------------------------------------------
end
#===============================================================================

#===============================================================================
if !$NEKO_RUBY.nil?
#-------------------------------------------------------------------------------
class NekoControl_Direction8 < NekoControl_Interface

  attr_reader(:sprite_stick)
  attr_reader(:bitmap_default)
  attr_reader(:bitmap_lower_left)
  attr_reader(:bitmap_down)
  attr_reader(:bitmap_lower_right)
  attr_reader(:bitmap_left)
  attr_reader(:bitmap_right)
  attr_reader(:bitmap_upper_left)
  attr_reader(:bitmap_up)
  attr_reader(:bitmap_upper_right)
  attr_reader(:bitmap_stick)
  attr_reader(:bitmap_resized_default)
  attr_reader(:bitmap_resized_lower_left)
  attr_reader(:bitmap_resized_down)
  attr_reader(:bitmap_resized_lower_right)
  attr_reader(:bitmap_resized_left)
  attr_reader(:bitmap_resized_right)
  attr_reader(:bitmap_resized_upper_left)
  attr_reader(:bitmap_resized_up)
  attr_reader(:bitmap_resized_upper_right)
  attr_reader(:bitmap_resized_stick)
  attr_reader(:stick_movable_radius)

  def initialize(x, y, z, width, height, viewport)
    super([], x, y, z, width, height, viewport)
    @stick_movable_radius = 0
    @sprite_stick = Sprite.new(viewport)
    @sprite_stick.z = @z + 1
    @sprite_stick.visible = false
    @stick_center_x = 0
    @stick_center_y = 0
  end

  def x=(value)
    super(value)
    @stick_center_x = @x + @sprite_stick.ox
    @sprite_stick.x = @stick_center_x
  end

  def y=(value)
    super(value)
    @stick_center_y = @y + @sprite_stick.oy
    @sprite_stick.y = @stick_center_y
  end

  def z=(value)
    super(value)
    @sprite_stick.z = @z + 1
  end

  def opacity=(value)
    super(value)
    @sprite_stick.opacity = @opacity
  end

  def visible=(value)
    super(value)
    @sprite_stick.visible = @visible
  end

  def stick_movable_radius=(value)
    value = 0 if value < 0
    @stick_movable_radius = value
  end

  def resize(width, height)
    super(width, height)
    @bitmap_resized_default = NekoControllerManager.create_resized_bitmap(@bitmap_default, @width, @height)
    @bitmap_resized_lower_left = NekoControllerManager.create_resized_bitmap(@bitmap_lower_left, @width, @height)
    @bitmap_resized_down = NekoControllerManager.create_resized_bitmap(@bitmap_down, @width, @height)
    @bitmap_resized_lower_right = NekoControllerManager.create_resized_bitmap(@bitmap_lower_right, @width, @height)
    @bitmap_resized_left = NekoControllerManager.create_resized_bitmap(@bitmap_left, @width, @height)
    @bitmap_resized_right = NekoControllerManager.create_resized_bitmap(@bitmap_right, @width, @height)
    @bitmap_resized_upper_left = NekoControllerManager.create_resized_bitmap(@bitmap_upper_left, @width, @height)
    @bitmap_resized_up = NekoControllerManager.create_resized_bitmap(@bitmap_up, @width, @height)
    @bitmap_resized_upper_right = NekoControllerManager.create_resized_bitmap(@bitmap_upper_right, @width, @height)
    @sprite.bitmap = @bitmap_resized_default
    @bitmap_resized_stick = NekoControllerManager.create_resized_bitmap(@bitmap_stick, @width, @height)
    @sprite_stick.bitmap = @bitmap_resized_stick
    @sprite_stick.ox = @width / 2
    @sprite_stick.oy = @height / 2
    @stick_center_x = @sprite.x + @sprite_stick.ox
    @stick_center_y = @sprite.y + @sprite_stick.oy
    @sprite_stick.x = @stick_center_x
    @sprite_stick.y = @stick_center_y
  end

  def set_image_default(bitmap_or_path)
    @bitmap_default = NekoControllerManager.get_bitmap(bitmap_or_path)
    @bitmap_resized_default = NekoControllerManager.create_resized_bitmap(@bitmap_default, @width, @height)
    @sprite.bitmap = @bitmap_resized_default
  end

  def set_image_lower_left(bitmap_or_path)
    @bitmap_lower_left = NekoControllerManager.get_bitmap(bitmap_or_path)
    @bitmap_resized_lower_left = NekoControllerManager.create_resized_bitmap(@bitmap_lower_left, @width, @height)
  end

  def set_image_down(bitmap_or_path)
    @bitmap_down = NekoControllerManager.get_bitmap(bitmap_or_path)
    @bitmap_resized_down = NekoControllerManager.create_resized_bitmap(@bitmap_down, @width, @height)
  end

  def set_image_lower_right(bitmap_or_path)
    @bitmap_lower_right = NekoControllerManager.get_bitmap(bitmap_or_path)
    @bitmap_resized_lower_right = NekoControllerManager.create_resized_bitmap(@bitmap_lower_right, @width, @height)
  end

  def set_image_left(bitmap_or_path)
    @bitmap_left = NekoControllerManager.get_bitmap(bitmap_or_path)
    @bitmap_resized_left = NekoControllerManager.create_resized_bitmap(@bitmap_left, @width, @height)
  end

  def set_image_right(bitmap_or_path)
    @bitmap_right = NekoControllerManager.get_bitmap(bitmap_or_path)
    @bitmap_resized_right = NekoControllerManager.create_resized_bitmap(@bitmap_right, @width, @height)
  end

  def set_image_upper_left(bitmap_or_path)
    @bitmap_upper_left = NekoControllerManager.get_bitmap(bitmap_or_path)
    @bitmap_resized_upper_left = NekoControllerManager.create_resized_bitmap(@bitmap_upper_left, @width, @height)
  end

  def set_image_up(bitmap_or_path)
    @bitmap_up = NekoControllerManager.get_bitmap(bitmap_or_path)
    @bitmap_resized_up = NekoControllerManager.create_resized_bitmap(@bitmap_up, @width, @height)
  end

  def set_image_upper_right(bitmap_or_path)
    @bitmap_upper_right = NekoControllerManager.get_bitmap(bitmap_or_path)
    @bitmap_resized_upper_right = NekoControllerManager.create_resized_bitmap(@bitmap_upper_right, @width, @height)
  end

  def set_image_stick(bitmap_or_path)
    @bitmap_stick = NekoControllerManager.get_bitmap(bitmap_or_path)
    @bitmap_resized_stick = NekoControllerManager.create_resized_bitmap(@bitmap_stick, @width, @height)
    @sprite_stick.bitmap = @bitmap_resized_stick
    @sprite_stick.ox = @width / 2
    @sprite_stick.oy = @height / 2
    @stick_center_x = @sprite.x + @sprite_stick.ox
    @stick_center_y = @sprite.y + @sprite_stick.oy
    @sprite_stick.x = @stick_center_x
    @sprite_stick.y = @stick_center_y
  end

  def move_stick(touch_x, touch_y)
    dx = @stick_center_x - touch_x
    dy = @stick_center_y - touch_y
    dist2 = dx * dx + dy * dy
    r = @stick_movable_radius
    if dist2 < r * r
      @sprite_stick.x = touch_x
      @sprite_stick.y = touch_y
    else
      angle = Math.atan2(dy, dx) + Math::PI
      @sprite_stick.x = @stick_center_x + r * Math.cos(angle)
      @sprite_stick.y = @stick_center_y + r * Math.sin(angle)
    end
  end

  def event_touch_over(finger_id, x, y, type)
    super(finger_id, x, y, type)
    @sprite.bitmap = @bitmap_resized_default
    @sprite_stick.x = @stick_center_x
    @sprite_stick.y = @stick_center_y
    @key.each { |k| NekoControllerManager.send_event(SDL::Event::KeyUp, k, false) }
    @key = []
  end

  def event_touch_in(finger_id, x, y, type)
    case type
    when NekoControllerManager::TouchType::DOWN, NekoControllerManager::TouchType::DRAG
      @first_pressed = true
      dx = @sprite.x + @width / 2 - x
      dy = @sprite.y + @height / 2 - y
      angle = Math.atan2(dy, dx) * (180 / Math::PI)
      case angle
      when (-67.5...-22.5)
        @sprite.bitmap = @bitmap_resized_lower_left
        sdl_key = [SDL::Key::DOWN, SDL::Key::LEFT]

      when (-112.5...-67.5)
        @sprite.bitmap = @bitmap_resized_down
        sdl_key = [SDL::Key::DOWN]

      when (-157.5...-112.5)
        @sprite.bitmap = @bitmap_resized_lower_right
        sdl_key = [SDL::Key::DOWN, SDL::Key::RIGHT]

      when (-22.5...22.5)
        @sprite.bitmap = @bitmap_resized_left
        sdl_key = [SDL::Key::LEFT]

      when (-180.0...-157.5), (157.5...180.0)
        @sprite.bitmap = @bitmap_resized_right
        sdl_key = [SDL::Key::RIGHT]

      when (22.5...67.5)
        @sprite.bitmap = @bitmap_resized_upper_left
        sdl_key = [SDL::Key::UP, SDL::Key::LEFT]

      when (67.5...112.5)
        @sprite.bitmap = @bitmap_resized_up
        sdl_key = [SDL::Key::UP]
        
      when (112.5...157.5)
        @sprite.bitmap = @bitmap_resized_upper_right
        sdl_key = [SDL::Key::UP, SDL::Key::RIGHT]
      end
      if @key != sdl_key
        @key.each { |k| NekoControllerManager.send_event(SDL::Event::KeyUp, k, false) }
        @key = sdl_key
        @key.each { |k| NekoControllerManager.send_event(SDL::Event::KeyDown, k, true) }
      end
      move_stick(x, y) if @sprite_stick.visible && @sprite_stick.opacity > 0 && @stick_movable_radius > 0

    when NekoControllerManager::TouchType::UP
      @first_pressed = false
      @sprite.bitmap = @bitmap_resized_default
      @sprite_stick.x = @stick_center_x
      @sprite_stick.y = @stick_center_y
      @key.each { |k| NekoControllerManager.send_event(SDL::Event::KeyUp, k, false) }
      @key = []

    end
  end
end
#-------------------------------------------------------------------------------
end
#===============================================================================

#===============================================================================
if !$NEKO_RUBY.nil?
#-------------------------------------------------------------------------------
class NekoControl_KeyButton < NekoControl_Interface

  attr_reader(:bitmap_default)
  attr_reader(:bitmap_pressed)
  attr_reader(:bitmap_resized_default)
  attr_reader(:bitmap_resized_pressed)

  def initialize(key, x, y, z, width, height, viewport)
    raise "버튼 키를 설정하지 않았습니다." if key == Input::NULL
    super(key, x, y, z, width, height, viewport)
  end

  def resize(width, height)
    super(width, height)
    if @bitmap_default.nil?
      @bitmap_resized_default = NekoControllerManager.create_resized_default_bitmap(NekoControllerManager::ENV::SURFACE[:UltimateDroidButton3], @width, @height)
    else
      @bitmap_resized_default = NekoControllerManager.create_resized_bitmap(@bitmap_default, @width, @height)
    end
    if @bitmap_pressed.nil?
      @bitmap_resized_pressed = NekoControllerManager.create_resized_default_bitmap(NekoControllerManager::ENV::SURFACE[:UltimateDroidButton3Pressed], @width, @height)
    else
      @bitmap_resized_pressed = NekoControllerManager.create_resized_bitmap(@bitmap_pressed, @width, @height)
    end
    @sprite.bitmap = @bitmap_resized_default
  end

  def set_image_default(bitmap_or_path)
    if bitmap_or_path.nil?
      @bitmap_default = nil
      @bitmap_resized_default = NekoControllerManager.create_resized_default_bitmap(NekoControllerManager::ENV::SURFACE[:UltimateDroidButton3], @width, @height)
    else
      @bitmap_default = NekoControllerManager.get_bitmap(bitmap_or_path)
      @bitmap_resized_default = NekoControllerManager.create_resized_bitmap(@bitmap_default, @width, @height)
    end
    @sprite.bitmap = @bitmap_resized_default
  end

  def set_image_pressed(bitmap_or_path)
    if bitmap_or_path.nil?
      @bitmap_pressed = nil
      @bitmap_resized_pressed = NekoControllerManager.create_resized_default_bitmap(NekoControllerManager::ENV::SURFACE[:UltimateDroidButton3Pressed], @width, @height)
    else
      @bitmap_pressed = NekoControllerManager.get_bitmap(bitmap_or_path)
      @bitmap_resized_pressed = NekoControllerManager.create_resized_bitmap(@bitmap_pressed, @width, @height)
    end
  end

  def event_touch_over(finger_id, x, y, type)
    super(finger_id, x, y, type)
    @sprite.bitmap = @bitmap_resized_default
    NekoControllerManager.send_event(SDL::Event::KeyUp, @key, false)
  end

  def event_touch_in(finger_id, x, y, type)
    case type
    when NekoControllerManager::TouchType::DOWN
      @first_pressed = true
      @sprite.bitmap = @bitmap_resized_pressed
      NekoControllerManager.send_event(SDL::Event::KeyDown, @key, true)

    when NekoControllerManager::TouchType::UP
      @first_pressed = false
      @sprite.bitmap = @bitmap_resized_default
      NekoControllerManager.send_event(SDL::Event::KeyUp, @key, false)

    when NekoControllerManager::TouchType::DRAG
    end
  end
end
#-------------------------------------------------------------------------------
end
#===============================================================================

#===============================================================================
if !$NEKO_RUBY.nil?
#-------------------------------------------------------------------------------
class NekoController_Template

  attr_reader(:viewport)
  attr_reader(:controls)

  def initialize
    @controls = NekoControlContainer.new
    # Viewport#visible method does not work.
    #@viewport = Viewport.new(0, 0, NekoControllerManager::SCREEN_WIDTH, NekoControllerManager::SCREEN_HEIGHT)
    @viewport = Viewport.new(-1, -1, 1, 1)
    @viewport.z = (1 << 31) - 1
  end

  def visible=(value)
    if value == true
      @viewport.rect.x = 0
      @viewport.rect.y = 0
      @viewport.rect.width = NekoControllerManager::SCREEN_WIDTH
      @viewport.rect.height = NekoControllerManager::SCREEN_HEIGHT
    elsif value == false
      @viewport.rect.x = -1
      @viewport.rect.y = -1
      @viewport.rect.width = 1
      @viewport.rect.height = 1
    end
  end
end
#-------------------------------------------------------------------------------
end
#===============================================================================

