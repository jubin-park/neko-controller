#===============================================================================
if $NEKO_RUBY.nil?
#-------------------------------------------------------------------------------  
module Input

  KeyMaps = {

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