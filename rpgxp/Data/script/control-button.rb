class ControlButton < ControlInterface

  attr_reader(:bitmap_default)
  attr_reader(:bitmap_pressed)

  def initialize(key, x, y, z, rect_touchable = true)
    super(key, x, y, z, rect_touchable)
    @bitmap_default = nil
    @bitmap_pressed = nil
  end

  def set_image_default(bitmap_or_path)
    @bitmap_default = if bitmap_or_path.is_a?(Bitmap)
        bitmap_or_path
      elsif bitmap_or_path.is_a?(String)
        Bitmap.new(bitmap_or_path)
      end
    @sprite.bitmap = @bitmap_default
  end

  def set_image_pressed(bitmap_or_path)
    @bitmap_pressed = if bitmap_or_path.is_a?(Bitmap)
        bitmap_or_path
      elsif bitmap_or_path.is_a?(String)
        Bitmap.new(bitmap_or_path)
      end
  end

  def self.listen(finger_id, x, y, type, control)
    # send key event
    case type
    when TouchType::DOWN
      Controller.send_event(SDL::Event::KeyDown, control.key, true)
      control.first_pressed = true
      control.sprite.bitmap = control.bitmap_pressed

    when TouchType::UP
      Controller.send_event(SDL::Event::KeyUp, control.key, false)
      control.first_pressed = false
      control.sprite.bitmap = control.bitmap_default

    when TouchType::DRAG
    end
  end

end