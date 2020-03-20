class ControlKeyButton < ControlInterface

  attr_reader(:bitmap_default)
  attr_reader(:bitmap_pressed)
  attr_reader(:bitmap_resized_default)
  attr_reader(:bitmap_resized_pressed)

  def initialize(key, x, y, z, width, height, viewport)
    raise "버튼 키를 설정하지 않았습니다." if key == Input::NULL
    super(key, x, y, z, width, height, viewport)
  end

  def resize(width, height)
    super(width, height)
    @bitmap_resized_default = Controller.create_resized_bitmap(@bitmap_default, @width, @height)
    @bitmap_resized_pressed = Controller.create_resized_bitmap(@bitmap_pressed, @width, @height)
    @sprite.bitmap = @bitmap_resized_default
  end

  def set_image_default(bitmap_or_path)
    @bitmap_default = Controller.get_bitmap(bitmap_or_path)
    @bitmap_resized_default = Controller.create_resized_bitmap(@bitmap_default, @width, @height)
    @sprite.bitmap = @bitmap_resized_default
  end

  def set_image_pressed(bitmap_or_path)
    @bitmap_pressed = Controller.get_bitmap(bitmap_or_path)
    @bitmap_resized_pressed = Controller.create_resized_bitmap(@bitmap_pressed, @width, @height)
  end

  def event_touch_over(finger_id, x, y, type)
    super(finger_id, x, y, type)
    @sprite.bitmap = @bitmap_resized_default
    Controller.send_event(SDL::Event::KeyUp, @key, false)
  end

  def event_touch_in(finger_id, x, y, type)
    case type
    when Controller::TouchType::DOWN
      @first_pressed = true
      @sprite.bitmap = @bitmap_resized_pressed
      Controller.send_event(SDL::Event::KeyDown, @key, true)

    when Controller::TouchType::UP
      @first_pressed = false
      @sprite.bitmap = @bitmap_resized_default
      Controller.send_event(SDL::Event::KeyUp, @key, false)

    when Controller::TouchType::DRAG
    end
  end
end