class ControlDirection4 < ControlInterface

  attr_reader(:sprite_stick)
  attr_reader(:bitmap_default)
  attr_reader(:bitmap_down)
  attr_reader(:bitmap_left)
  attr_reader(:bitmap_right)
  attr_reader(:bitmap_up)
  attr_reader(:bitmap_stick)
  attr_reader(:stick_movable_radius)

  def initialize(x, y, z, rect_touchable = true)
    super(nil, x, y, z, rect_touchable)
    @sprite_stick = Sprite.new(Controller.viewport)
    @sprite_stick.z = @sprite.z + 1
    @sprite_stick.visible = false
    @stick_center_x = 0
    @stick_center_y = 0
  end

  def set_image_default(bitmap_or_path)
    @bitmap_default = ControlInterface.get_bitmap(bitmap_or_path)
    @sprite.bitmap ||= @bitmap_default
  end

  def set_image_down(bitmap_or_path)
    @bitmap_down = ControlInterface.get_bitmap(bitmap_or_path)
  end

  def set_image_left(bitmap_or_path)
    @bitmap_left = ControlInterface.get_bitmap(bitmap_or_path)
  end

  def set_image_right(bitmap_or_path)
    @bitmap_right = ControlInterface.get_bitmap(bitmap_or_path)
  end

  def set_image_up(bitmap_or_path)
    @bitmap_up = ControlInterface.get_bitmap(bitmap_or_path)
  end

  def set_image_stick(radius, bitmap_or_path)
    @stick_movable_radius = radius
    @bitmap_stick = ControlInterface.get_bitmap(bitmap_or_path)
    @sprite_stick.bitmap = @bitmap_stick
    @sprite_stick.ox = @bitmap_stick.width / 2
    @sprite_stick.oy = @bitmap_stick.height / 2
    @stick_center_x = @sprite.x + (@sprite.bitmap.width - @bitmap_stick.width) / 2 + @sprite_stick.ox
    @stick_center_y = @sprite.y + (@sprite.bitmap.height - @bitmap_stick.height) / 2 + @sprite_stick.oy
    @sprite_stick.x = @stick_center_x
    @sprite_stick.y = @stick_center_y
    @sprite_stick.visible = true
  end

  def move_stick(touch_x, touch_y)
    dx = @stick_center_x - touch_x
    dy = @stick_center_y - touch_y
    dist2 = dx * dx + dy * dy
    r = @stick_movable_radius
    if dist2 < r * r
      @sprite_stick.x = touch_x
      @sprite_stick.y = touch_y
    else
      angle = Math.atan2(dy, dx) + Math::PI
      @sprite_stick.x = @stick_center_x + r * Math.cos(angle)
      @sprite_stick.y = @stick_center_y + r * Math.sin(angle)
    end
  end

  def event_touch_over(finger_id, x, y, type)
    super(finger_id, x, y, type)
    @sprite.bitmap = @bitmap_default
    @sprite_stick.x = @stick_center_x
    @sprite_stick.y = @stick_center_y
    Controller.send_event(SDL::Event::KeyUp, @key, false)
    @key = nil
  end

  def event_touch_in(finger_id, x, y, type)
    case type
    when Controller::TouchType::DOWN, Controller::TouchType::DRAG
      @first_pressed = true
      dx = @sprite.x + @sprite.bitmap.width / 2 - x
      dy = @sprite.y + @sprite.bitmap.height / 2 - y
      angle = Math.atan2(dy, dx) * (180 / Math::PI)
      case angle
      when (-90.0...-45.0), (-135.0...-90.0)
        @sprite.bitmap = @bitmap_down
        sdl_key = SDL::Key::DOWN
      when (-45.0...0.0), (0.0...45.0)
        @sprite.bitmap = @bitmap_left
        sdl_key = SDL::Key::LEFT
      when (-180.0...-135.0), (135.0...180.0)
        @sprite.bitmap = @bitmap_right
        sdl_key = SDL::Key::RIGHT
      when (45.0...90.0), (90.0...135.0)
        @sprite.bitmap = @bitmap_up
        sdl_key = SDL::Key::UP
      end
      if @key != sdl_key
        Controller.send_event(SDL::Event::KeyUp, @key, false) if !@key.nil?
        @key = sdl_key
        Controller.send_event(SDL::Event::KeyDown, @key, true)
      end
      move_stick(x, y) if @sprite_stick.visible && @sprite_stick.opacity > 0

    when Controller::TouchType::UP
      @first_pressed = false
      @sprite.bitmap = @bitmap_default
      @sprite_stick.x = @stick_center_x
      @sprite_stick.y = @stick_center_y
      Controller.send_event(SDL::Event::KeyUp, @key, false)
      @key = nil

    end
  end

end