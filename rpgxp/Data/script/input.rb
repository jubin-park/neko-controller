#===============================================================================
if $NEKO_RUBY == 187 and RGSS.is_mobile?
#-------------------------------------------------------------------------------
module Input
  KeyMaps = {
    ## RGSS default key
    # https://www.rubydoc.info/github/cstrahan/open-rpg-maker/Input
    :DOWN => [2, SDL::Key::DOWN], #, SDL::Key::S],
    :LEFT => [4, SDL::Key::LEFT], #, SDL::Key::A],
    :RIGHT => [6, SDL::Key::RIGHT], #, SDL::Key::D],
    :UP => [8, SDL::Key::UP], #, SDL::Key::W],
    :A => [11, SDL::Key::LSHIFT],
    :B => [12, SDL::Key::X, SDL::Key::ESCAPE],
    :C => [13, SDL::Key::Z, SDL::Key::RETURN],
    :X => [14, SDL::Key::A],
    :Y => [15, SDL::Key::D],
    :Z => [16, SDL::Key::S],
    :L => [17, SDL::Key::PAGEUP],
    :R => [18, SDL::Key::PAGEDOWN],
    :SHIFT => [21, SDL::Key::LSHIFT, SDL::Key::RSHIFT],
    :CTRL => [22, SDL::Key::LCTRL, SDL::Key::RCTRL],
    :ALT => [23, SDL::Key::LALT, SDL::Key::RALT],
    :F5 => [25, SDL::Key::F5],
    :F6 => [26, SDL::Key::F6],
    :F7 => [27, SDL::Key::F7],
    :F8 => [28, SDL::Key::F8],
    :F9 => [29, SDL::Key::F9],
    :SHOW_FPS => [108, SDL::Key::F2],
    :RESET => [109, SDL::Key::F12],

    ## keyboard
    :KB_ESCAPE => [SDL::Key::ESCAPE],
    :KB_F1 => [SDL::Key::F1],
    :KB_F2 => [SDL::Key::F2],
    :KB_F3 => [SDL::Key::F3],
    :KB_F4 => [SDL::Key::F4],
    :KB_F5 => [SDL::Key::F5],
    :KB_F6 => [SDL::Key::F6],
    :KB_F7 => [SDL::Key::F7],
    :KB_F8 => [SDL::Key::F8],
    :KB_F9 => [SDL::Key::F9],
    :KB_F10 => [SDL::Key::F10],
    :KB_F11 => [SDL::Key::F11],
    :KB_F12 => [SDL::Key::F12],
    :KB_F13 => [SDL::Key::F13],
    :KB_F14 => [SDL::Key::F14],
    :KB_F15 => [SDL::Key::F15],

    :KB_0 => [SDL::Key::K0],
    :KB_1 => [SDL::Key::K1],
    :KB_2 => [SDL::Key::K2],
    :KB_3 => [SDL::Key::K3],
    :KB_4 => [SDL::Key::K4],
    :KB_5 => [SDL::Key::K5],
    :KB_6 => [SDL::Key::K6],
    :KB_7 => [SDL::Key::K7],
    :KB_8 => [SDL::Key::K8],
    :KB_9 => [SDL::Key::K9],

    :KB_TILDE => [SDL::Key::GRAVE],
    :KB_TAB => [SDL::Key::TAB],
    :KB_CAPSLOCK => [SDL::Key::CAPSLOCK],
    :KB_LSHIFT => [SDL::Key::LSHIFT],
    :KB_LCTRL => [SDL::Key::LCTRL],
    :KB_LALT => [SDL::Key::LALT],
    :KB_BACKSPACE => [SDL::Key::BACKSPACE],
    :KB_ENTER => [SDL::Key::RETURN],
    :KB_RSHIFT => [SDL::Key::RSHIFT],
    :KB_RALT => [SDL::Key::RALT],
    :KB_RCTRL => [SDL::Key::RCTRL],

    :KB_MINUS => [SDL::Key::MINUS],
    :KB_EQUALS => [SDL::Key::EQUALS],
    :KB_BACKSLASH => [SDL::Key::BACKSLASH],
    :KB_LEFTBRACKET => [SDL::Key::LEFTBRACKET],
    :KB_RIGHTBRACKET = [SDL::Key::RIGHTBRACKET],
    :KB_SEMICOLON = [SDL::Key::SEMICOLON],
    :KB_APOSTROPHE => [SDL::Key::APOSTROPHE],
    :KB_COMMA => [SDL::Key::COMMA],
    :KB_PERIOD => [SDL::Key::PERIOD],
    :KB_SLASH => [SDL::Key::SLASH],
    :KB_SPACE => [SDL::Key::SPACE],

    :KB_A => [SDL::Key::A],
    :KB_B => [SDL::Key::B],
    :KB_C => [SDL::Key::C],
    :KB_D => [SDL::Key::D],
    :KB_E => [SDL::Key::E],
    :KB_F => [SDL::Key::F],
    :KB_G => [SDL::Key::G],
    :KB_H => [SDL::Key::H],
    :KB_I => [SDL::Key::I],
    :KB_J => [SDL::Key::J],
    :KB_K => [SDL::Key::K],
    :KB_L => [SDL::Key::L],
    :KB_M => [SDL::Key::M],
    :KB_N => [SDL::Key::N],
    :KB_O => [SDL::Key::O],
    :KB_P => [SDL::Key::P],
    :KB_Q => [SDL::Key::Q],
    :KB_R => [SDL::Key::R],
    :KB_S => [SDL::Key::S],
    :KB_T => [SDL::Key::T],
    :KB_U => [SDL::Key::U],
    :KB_V => [SDL::Key::V],
    :KB_W => [SDL::Key::W],
    :KB_X => [SDL::Key::X],
    :KB_Y => [SDL::Key::Y],
    :KB_Z => [SDL::Key::Z],

    :KB_PRINTSCREEN => [SDL::Key::PRINTSCREEN], # VK_SNAPSHOT = 0x2C
    :KB_SCROLLLOCK => [SDL::Key::SCROLLLOCK], # VK_SCROLL = 0x91
    :KB_PAUSEBREAK => [SDL::Key::PAUSEBREAK], # VK_PAUSE = 0x13
    :KB_INSERT => [SDL::Key::INSERT], # VK_INSERT = 0x2D
    :KB_HOME => [SDL::Key::HOME], # VK_HOME = 0x24
    :KB_PAGEUP => [SDL::Key::PAGEUP],
    :KB_DELETE => [SDL::Key::DELETE],
    :KB_END => [SDL::Key::END],
    :KB_PAGEDOWN => [SDL::Key::PAGEDOWN],
    :KB_UP => [SDL::Key::UP],
    :KB_LEFT => [SDL::Key::LEFT],
    :KB_DOWN => [SDL::Key::DOWN],
    :KB_RIGHT => [SDL::Key::RIGHT],

    # KEYPAD
    :KB_KEYPAD_0 => [SDL::Key::KP0],
    :KB_KEYPAD_1 => [SDL::Key::KP1],
    :KB_KEYPAD_2 => [SDL::Key::KP2],
    :KB_KEYPAD_3 => [SDL::Key::KP3],
    :KB_KEYPAD_4 => [SDL::Key::KP4],
    :KB_KEYPAD_5 => [SDL::Key::KP5],
    :KB_KEYPAD_6 => [SDL::Key::KP6],
    :KB_KEYPAD_7 => [SDL::Key::KP7],
    :KB_KEYPAD_8 => [SDL::Key::KP8],
    :KB_KEYPAD_9 => [SDL::Key::KP9],
    :KB_NUMLOCK => [SDL::Key::NUMLOCK],
    :KB_KEYPAD_DIVIDE => [SDL::Key::KP_DIVIDE],
    :KB_KEYPAD_MULTIPLY => [SDL::Key::KP_MULTIPLY],
    :KB_KEYPAD_MINUS => [SDL::Key::KP_MINUS],
    :KB_KEYPAD_PLUS => [SDL::Key::KP_PLUS],
    :KB_KEYPAD_ENTER => [SDL::Key::KP_ENTER],
    :KB_KEYPAD_PERIOD => [SDL::Key::KP_PERIOD],
    :KB_KEYPAD_EQUALS => [SDL::Key::KP_EQUALS],
  }

  Entities = {}

  KeyMaps.each do |key, value|
    const_set(key, value[0])
    value[1..-1].each { |entity| Entities[entity] = value[0] }
  end

  @status = {}
  @events = []
  @update_replaced = true

  class << self
    attr_accessor :events

    # Updates input data. As a general rule, this method is called once per frame.
    def _update
      if @update_replaced
        for k, v in @status
          @status[k] = v.next
        end
        while event = @events.shift
          key = Entities[event.sym]
          next if event.repeat > 0
          if event.press
            case key
            when :SHOW_FPS
              RGSS.show_fps = !RGSS.show_fps
            when :RESET
              raise RGSSReset
            else
              @status[key] = 0
            end
          else
            @status.delete key
          end
        end
      end
      @update_replaced = true
    end

    def update
      @update_replaced = false
      for k, v in @status
        @status[k] = v.next
      end
      while event = @events.shift
        key = Entities[event.sym]
        next if event.repeat > 0
        if event.press
          case key
            when :SHOW_FPS
              RGSS.show_fps = !RGSS.show_fps
            when :RESET
              raise RGSSReset
            else
              @status[key] = 0
          end
        else
          @status.delete key
        end
      end
    end

    # Determines whether the button corresponding to the symbol sym is currently being pressed.
    #
    # If the button is being pressed, returns TRUE. If not, returns FALSE.
    #
    #  if Input.press?(:C)
    #    do_something
    #  end

    def _press?(sym)
      sym = KeyMaps[sym][0] if sym.class == Symbol
      return !@status[sym].nil?
    end

    def press?(*args)
      return _press?(*args)
    end

    # Determines whether the button corresponding to the symbol sym is currently being pressed again.
    #
    # "Pressed again" is seen as time having passed between the button being not pressed and being pressed.
    #
    # If the button is being pressed, returns TRUE. If not, returns FALSE.

    def _trigger?(sym)
      sym = KeyMaps[sym][0] if sym.class == Symbol
      return @status[sym] && @status[sym].zero?
    end

    def trigger?(*args)
      return _trigger?(*args)
    end

    # Determines whether the button corresponding to the symbol sym is currently being pressed again.
    #
    # Unlike trigger?, takes into account the repeated input of a button being held down continuously.
    #
    # If the button is being pressed, returns TRUE. If not, returns FALSE.

    def _repeat?(sym)
      sym = KeyMaps[sym][0] if sym.class == Symbol
      @status[sym] and (@status[sym].zero? or (@status[sym] > 10 and (@status[sym] % 4).zero?))
    end

    def repeat?(*args)
      return _repeat?(*args)
    end

    # Checks the status of the directional buttons, translates the data into a specialized 4-direction input format, and returns the number pad equivalent (2, 4, 6, 8).
    #
    # If no directional buttons are being pressed (or the equivalent), returns 0.

    def _status(sym)
      return @status[KeyMaps[sym][0]]
    end

    def status(*args)
      return _status(*args)
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

    # Checks the status of the directional buttons, translates the data into a specialized 8-direction input format, and returns the number pad equivalent (1, 2, 3, 4, 6, 7, 8, 9).
    #
    # If no directional buttons are being pressed (or the equivalent), returns 0.

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

    def _win32_to_sdl(button)
      case button
      when 0x28
        return NekoInput::DOWN
      when 0x25
        return NekoInput::LEFT
      when 0x27 # Right
        return NekoInput::RIGHT
      when 0x26 # Up
        return NekoInput::UP
      when 0x5A, 0x10 # Z, Shift
        return NekoInput::A
      when 0x58, 0x1B # X, ESC
        return NekoInput::B
      when 0x43, 0x0d, 0x20 # C, ENTER, Space
        return NekoInput::C
      when 0x41 # A
        return NekoInput::X
      when 0x53 # S
        return NekoInput::Y
      when 0x44 # D
        return NekoInput::Z
      when 0x51, 0x21 # Q, Page Up
        return NekoInput::L
      when 0x57, 0x22 # W, Page Down
        return NekoInput::R
      when 0x10
        return NekoInput::SHIFT
      when 0x11
        return NekoInput::CTRL
      when 0x12
        return NekoInput::ALT
      when 0x74 # F5
        return NekoInput::F5
      when 0x75 # F6
        return NekoInput::F6
      when 0x76 # F7
        return NekoInput::F7
      when 0x77 # F8
        return NekoInput::F8
      when 0x78 # F9
        return NekoInput::F9
      else
        return -1
      end
    end
  end
end

NekoInput = Input
#-------------------------------------------------------------------------------
end
#===============================================================================