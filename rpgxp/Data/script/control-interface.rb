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
  attr_reader(:width)
  attr_reader(:height)
  attr_reader(:created_at)
  attr_accessor(:first_pressed)
  attr_accessor(:later_pressed)
  
  def initialize(key, x, y, z)
    @key = key
    @sprite = Sprite.new(Controller.viewport)
    @sprite.x = x
    @sprite.y = y
    @sprite.z = z
    @created_at = SDL.getTicks()
    @first_pressed = false
    @later_pressed = false
    @@controls.push(self)
  end

  def is_range?(touch_x, touch_y)
    return touch_x >= @sprite.x && touch_x < @sprite.x + @width && touch_y >= @sprite.y && touch_y < @sprite.y + @height
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
      next if 0 == ((control.get_pixel(touch_x, touch_y) >> 24) & 0xff)
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
        e = SDL::Event::KeyUp.new
        e.sym = @@last_target_control.key
        e.mod = 0
        e.repeat = 0
        e.press = false
        Input.events << e
        @@last_target_control.later_pressed = false
        @@last_target_control.first_pressed = false
      end
      @@last_target_control = nil
    end
    return if target_control.nil?
    # send key event
    case type
    when TouchType::DOWN
      e = SDL::Event::KeyDown.new
      e.sym = target_control.key
      e.mod = 0
      e.repeat = 0
      e.press = true
      Input.events << e
      target_control.first_pressed = true

    when TouchType::UP
      e = SDL::Event::KeyUp.new
      e.sym = target_control.key
      e.mod = 0
      e.repeat = 0
      e.press = false
      Input.events << e
      target_control.first_pressed = false

    when TouchType::DRAG
    end
    @@last_target_control = target_control
  end
end