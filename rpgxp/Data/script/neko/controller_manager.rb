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
    OPACITY = SDL.getenv("DPAD_OPACITY").to_i
    sdl_key = {4 => SDL::Key::A, 22 => SDL::Key::S, 40 => SDL::Key::RETURN, 41 => SDL::Key::ESCAPE, 225 => SDL::Key::LSHIFT}
    KEY_1 = sdl_key[SDL.getenv("KEY_1").to_i]
    KEY_2 = sdl_key[SDL.getenv("KEY_2").to_i]
    KEY_3 = sdl_key[SDL.getenv("KEY_3").to_i]
    KEY_4 = sdl_key[SDL.getenv("KEY_4").to_i]
    SDL.putenv("DPAD_SCALE=0")
  end

  DEVICE_WIDTH = 0
  DEVICE_HEIGHT = 0
  SCREEN_WIDTH = 0
  SCREEN_HEIGHT = 0

  @@entity = nil
  @@last_target_control = nil
  @@last_finger_id = 0

  def self.entity
    return @@entity
  end

  def self.entity=(controller)
    raise "올바른 형식의 컨트롤러가 아닙니다." if controller.nil?
    raise "컨트롤러에 viewport가 없습니다." if controller.viewport.nil?
    @@entity = controller
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
end

NekoControllerManager.recalculate_resolution_value

#-------------------------------------------------------------------------------
end
#===============================================================================