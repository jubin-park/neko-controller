class ControlInterface

  module TouchType
    DOWN = 0x0
    UP   = 0x1
    DRAG = 0x2
  end

  @@controls = []
  @@last_target_control = nil

  attr_reader(:key)
  attr_reader(:sprite)
  attr_reader(:rect_touchable)
  attr_reader(:created_at)
  attr_accessor(:first_pressed)
  attr_accessor(:later_pressed)

  def initialize(key, x, y, z, rect_touchable)
    @key = key
    @sprite = Sprite.new(Controller.viewport)
    @sprite.x = x
    @sprite.y = y
    @sprite.z = z
    @rect_touchable = rect_touchable
    @created_at = SDL.getTicks()
    @first_pressed = false
    @later_pressed = false
    @@controls.push(self)
  end

  def is_range?(touch_x, touch_y)
    return touch_x >= @sprite.x && touch_x < @sprite.x + @sprite.bitmap.width && touch_y >= @sprite.y && touch_y < @sprite.y + @sprite.bitmap.height
  end

  def get_pixel(touch_x, touch_y)
    return @sprite.bitmap.entity.getPixel(touch_x - @sprite.x, touch_y - @sprite.y)
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

  def self.listen(finger_id, x, y, type)
    target_control = get_target_control(x, y)
    if !@@last_target_control.nil? && @@last_target_control != target_control
      if @@last_target_control.first_pressed
        Controller.send_event(SDL::Event::KeyUp, @@last_target_control.key, false)
        @@last_target_control.later_pressed = false
        @@last_target_control.first_pressed = false
        @@last_target_control.sprite.bitmap = @@last_target_control.bitmap_default
      end
      @@last_target_control = nil
    end
    return if target_control.nil?
    ControlButton.listen(finger_id, x, y, type, target_control) if target_control.class == ControlButton
    @@last_target_control = target_control
  end
end