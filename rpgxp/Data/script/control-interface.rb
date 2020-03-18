class ControlInterface

  attr_reader(:key)
  attr_reader(:x)
  attr_reader(:y)
  attr_reader(:z)
  attr_reader(:width)
  attr_reader(:height)
  attr_reader(:opacity)
  attr_reader(:visible)
  attr_reader(:rect_touchable)
  attr_reader(:created_at)
  attr_accessor(:first_pressed)

  def initialize(key, x, y, z, width, height, rect_touchable)
    @key = key
    @sprite = Sprite.new(Controller.viewport)
    @sprite.x = @x = x
    @sprite.y = @y = y
    @sprite.z = @z = z
    @width = width
    @height = height
    @sprite.opacity = @opacity = 255
    @sprite.visible = @visible = true
    @rect_touchable = rect_touchable
    @created_at = SDL.getTicks()
    @first_pressed = false
    Controller.controls.push(self)
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