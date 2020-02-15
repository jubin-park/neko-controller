module Controller

  module TouchType
    DOWN = 0x0
    UP   = 0x1
    DRAG = 0x2
  end

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

  DEVICE_WIDTH = 0
  DEVICE_HEIGHT = 0
  SCREEN_WIDTH = 0
  SCREEN_HEIGHT = 0

  @@viewport = Viewport.new(0, 0, 0, 0)
  @@viewport.z = (1 << 31) - 1
  @@controls = Array.new(32)
  @@last_target_control = nil

  def self.viewport
    return @@viewport
  end

  def self.controls
    return @@controls
  end

  def self.recalculate_resolution_value
    self.const_set(:DEVICE_WIDTH, Graphics.entity.w)
    self.const_set(:DEVICE_HEIGHT, Graphics.entity.h)
    self.const_set(:SCREEN_WIDTH, Graphics.width)
    self.const_set(:SCREEN_HEIGHT, Graphics.height)
    @ratio_height = DEVICE_HEIGHT / SCREEN_HEIGHT.to_f
    @new_width = SCREEN_WIDTH * @ratio_height
    @remain_width = (DEVICE_WIDTH - @new_width) / 2
    @ratio_width = DEVICE_WIDTH / @new_width
    @ratio_remain_width = @remain_width / DEVICE_WIDTH.to_f
    @new_width2 = SCREEN_WIDTH * @ratio_width
    @@viewport.width = SCREEN_WIDTH
    @@viewport.height = SCREEN_HEIGHT
  end

  def self.get_target_control(touch_x, touch_y)
    detected_controls = []
    @@controls.each do |control|
      next if !control.sprite.visible
      next if 0 == control.sprite.opacity
      next if !control.is_range?(touch_x, touch_y)
      next if !control.rect_touchable && 0 == ((control.get_pixel(touch_x, touch_y) >> 24) & 0xFF)
      detected_controls.push(control)
    end
    return detected_controls.max do |a, b|
        if a.sprite.z == b.sprite.z
          a.created_at <=> b.created_at
        else
          a.sprite.z <=> b.sprite.z
        end
      end
  end

  def self.listen(finger_id, unit_x, unit_y, type)
    x = ((unit_x - @ratio_remain_width) * @new_width2).to_i
    y = (unit_y * SCREEN_HEIGHT).to_i
    target_control = get_target_control(x, y)
    if !@@last_target_control.nil? && @@last_target_control != target_control
      if @@last_target_control.first_pressed
        @@last_target_control.event_touch_over(finger_id, x, y, type)
      end
    end
    @@last_target_control = target_control
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
end

Controller.recalculate_resolution_value