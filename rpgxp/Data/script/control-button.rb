class ControlButton < ControlInterface

  attr_reader(:bitmap_default)
  attr_reader(:bitmap_pressed)

  def initialize(key, x, y, z, rect_touchable = false)
    super(key, x, y, z, rect_touchable)
    @bitmap_default = nil
    @bitmap_pressed = nil
  end

  def set_image_default(bitmap_or_path)
    @bitmap_default = ControlInterface.get_bitmap(bitmap_or_path)
    @sprite.bitmap ||= @bitmap_default
  end

  def set_image_pressed(bitmap_or_path)
    @bitmap_pressed = ControlInterface.get_bitmap(bitmap_or_path)
  end

  def event_touch_over(finger_id, x, y, type)
    super(finger_id, x, y, type)
    Controller.send_event(SDL::Event::KeyUp, @key, false)
    @sprite.bitmap = @bitmap_default
  end

  def event_touch_in(finger_id, x, y, type)
    # send key event
    case type
    when TouchType::DOWN
      Controller.send_event(SDL::Event::KeyDown, @key, true)
      @first_pressed = true
      @sprite.bitmap = @bitmap_pressed

    when TouchType::UP
      Controller.send_event(SDL::Event::KeyUp, @key, false)
      @first_pressed = false
      @sprite.bitmap = @bitmap_default

    when TouchType::DRAG
    end
  end
end