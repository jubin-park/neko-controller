module Controller

  DEVICE_WIDTH = 0
  DEVICE_HEIGHT = 0
  SCREEN_WIDTH = 0
  SCREEN_HEIGHT = 0

  module Default
    MAGNIFICATION = SDL.getenv("DPAD_SCALE").to_f
    OPACITY = SDL.getenv("DPAD_OPACITY").to_i
    # scancode => keycode
    # A : 4 => 0x61
    # S : 22 => 0x73
    # RETURN : 40 => 0x0D
    # ESCAPE : 41 => 0x1B
    # LSHFT : 225 => 0x800000E1
    keycode = {4=>0x61, 22=>0x73, 40=>0x0D, 41=>0x1B, 225=>0x800000E1}
    KEY_1 = keycode[SDL.getenv("KEY_1").to_i]
    KEY_2 = keycode[SDL.getenv("KEY_2").to_i]
    KEY_3 = keycode[SDL.getenv("KEY_3").to_i]
    KEY_4 = keycode[SDL.getenv("KEY_4").to_i]
    KEY_5 = SDL::Key::LCTRL#SDL::Key::S
    SDL.putenv("DPAD_SCALE=0") # DO NOT REMOVE !
  end

  @@viewport = Viewport.new(0, 0, 0, 0)
  @@viewport.z = (1 << 31) - 1

  def self.viewport
    return @@viewport
  end

  def self.recalculate_resolution_value
    self.const_set(:DEVICE_WIDTH, Graphics.entity.w.to_f)
    self.const_set(:DEVICE_HEIGHT, Graphics.entity.h.to_f)
    self.const_set(:SCREEN_WIDTH, Graphics.width.to_f)
    self.const_set(:SCREEN_HEIGHT, Graphics.height.to_f)
    @@viewport.width = SCREEN_WIDTH
    @@viewport.height = SCREEN_HEIGHT
    @ratio_height = DEVICE_HEIGHT / SCREEN_HEIGHT
    @new_width = SCREEN_WIDTH * @ratio_height
    @remain_width = (DEVICE_WIDTH - @new_width) / 2
    @ratio_width = DEVICE_WIDTH / @new_width
    @ratio_remain_width = @remain_width / DEVICE_WIDTH
    @new_width2 = SCREEN_WIDTH * @ratio_width
  end

  def self.listen(finger_id, unit_x, unit_y, touch_type)
    x = (unit_x - @ratio_remain_width) * @new_width2
    y = unit_y * SCREEN_HEIGHT
    ControlInterface.listen(finger_id, x.to_i, y.to_i, touch_type)
  end
end

Controller.recalculate_resolution_value