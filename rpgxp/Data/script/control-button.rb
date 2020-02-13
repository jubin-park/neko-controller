class ControlButton

  module TouchType
    DOWN = 0x0
    UP   = 0x1
    DRAG = 0x2
  end

  @@buttons = []
  @@last_target_button = nil

  attr_reader(:key)
  attr_reader(:sprite)
  attr_reader(:width)
  attr_reader(:height)
  attr_reader(:created_at)
  attr_accessor(:first_pressed)
  attr_accessor(:later_pressed)
  
  def initialize(key, x, y, z, bitmap_or_path)
    @key = key
    @sprite = Sprite.new(Controller.viewport)
    if bitmap_or_path.is_a?(Bitmap)
      @width = bitmap_or_path.width
      @height = bitmap_or_path.height
      @sprite.bitmap = bitmap_or_path
    elsif bitmap_or_path.is_a?(String)
      b = Bitmap.new(bitmap_or_path)
      @width = b.width
      @height = b.height
      @sprite.bitmap = b
    end
    @sprite.x = x
    @sprite.y = y
    @sprite.z = z
    @created_at = SDL.getTicks()
    @first_pressed = false
    @later_pressed = false
    @@buttons.push(self)
  end

  def is_range?(touch_x, touch_y)
    return touch_x >= @sprite.x && touch_x < @sprite.x + @width && touch_y >= @sprite.y && touch_y < @sprite.y + @height
  end

  def get_pixel(touch_x, touch_y)
    return @sprite.bitmap.entity.getPixel(touch_x - @sprite.x, touch_y - @sprite.y)
  end

  def self.get_target_button(touch_x, touch_y)
    detected_buttons = []
    @@buttons.each do |button|
      next if !button.sprite.visible
      next if 0 == button.sprite.opacity
      next if !button.is_range?(touch_x, touch_y)
      next if 0 == ((button.get_pixel(touch_x, touch_y) >> 24) & 0xff)
      detected_buttons.push(button)
    end
    return detected_buttons.max do |a, b|
        if a.sprite.z == b.sprite.z
          a.created_at <=> b.created_at
        else
          a.sprite.z <=> b.sprite.z
        end
      end
  end

  def self.listen(finger_id, x, y, type)
    target_button = get_target_button(x, y)
    if !@@last_target_button.nil? && @@last_target_button != target_button
      if @@last_target_button.first_pressed
        e = SDL::Event::KeyUp.new
        e.sym = @@last_target_button.key
        e.mod = 0
        e.repeat = 0
        e.press = false
        Input.events << e
        @@last_target_button.later_pressed = false
        @@last_target_button.first_pressed = false
      end
      @@last_target_button = nil
    end
    return if target_button.nil?
    # send key event
    case type
    when TouchType::DOWN
      e = SDL::Event::KeyDown.new
      e.sym = target_button.key
      e.mod = 0
      e.repeat = 0
      e.press = true
      Input.events << e
      target_button.first_pressed = true

    when TouchType::UP
      e = SDL::Event::KeyUp.new
      e.sym = target_button.key
      e.mod = 0
      e.repeat = 0
      e.press = false
      Input.events << e
      target_button.first_pressed = false

    when TouchType::DRAG
    end
    @@last_target_button = target_button
  end
end