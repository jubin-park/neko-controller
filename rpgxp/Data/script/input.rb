#===============================================================================
if !$NEKO_RUBY.nil?
#-------------------------------------------------------------------------------
module Input

  KeyMaps = {

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
    :KB_KEYPAD_EQUALS => SDL::Key::KP_EQUALS,
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