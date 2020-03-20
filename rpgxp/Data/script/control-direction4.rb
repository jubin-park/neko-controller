class ControlDirection4 < ControlInterface

  attr_reader(:sprite_stick)
  attr_reader(:bitmap_default)
  attr_reader(:bitmap_down)
  attr_reader(:bitmap_left)
  attr_reader(:bitmap_right)
  attr_reader(:bitmap_up)
  attr_reader(:bitmap_stick)
  attr_reader(:bitmap_resized_default)
  attr_reader(:bitmap_resized_down)
  attr_reader(:bitmap_resized_left)
  attr_reader(:bitmap_resized_right)
  attr_reader(:bitmap_resized_up)
  attr_reader(:bitmap_resized_stick)
  attr_reader(:stick_movable_radius)

  def initialize(x, y, z, width, height, viewport)
    super(nil, x, y, z, width, height, viewport)
    @sprite_stick = Sprite.new(viewport)
    @sprite_stick.z = @z + 1
    @sprite_stick.visible = false
    @stick_center_x = 0
    @stick_center_y = 0
  end

  def x=(value)
    super(value)
    @stick_center_x = @x + @sprite_stick.ox
    @sprite_stick.x = @stick_center_x
  end

  def y=(value)
    super(value)
    @stick_center_y = @y + @sprite_stick.oy
    @sprite_stick.y = @stick_center_y
  end

  def z=(value)
    super(value)
    @sprite_stick.z = @z + 1
  end

  def opacity=(value)
    super(value)
    @sprite_stick.opacity = @opacity
  end

  def visible=(value)
    super(value)
    @sprite_stick.visible = @visible
  end

  def resize(width, height)
    super(width, height)
    @bitmap_resized_default = Controller.create_resized_bitmap(@bitmap_default, @width, @height)
    @bitmap_resized_down = Controller.create_resized_bitmap(@bitmap_down, @width, @height)
    @bitmap_resized_left = Controller.create_resized_bitmap(@bitmap_left, @width, @height)
    @bitmap_resized_right = Controller.create_resized_bitmap(@bitmap_right, @width, @height)
    @bitmap_resized_up = Controller.create_resized_bitmap(@bitmap_up, @width, @height)
    @sprite.bitmap = @bitmap_resized_default
    @bitmap_resized_stick = Controller.create_resized_bitmap(@bitmap_stick, @width, @height)
    @sprite_stick.bitmap = @bitmap_resized_stick
    @sprite_stick.ox = @width / 2
    @sprite_stick.oy = @height / 2
    @stick_center_x = @sprite.x + @sprite_stick.ox
    @stick_center_y = @sprite.y + @sprite_stick.oy
    @sprite_stick.x = @stick_center_x
    @sprite_stick.y = @stick_center_y
  end

  def set_image_default(bitmap_or_path)
    @bitmap_default = Controller.get_bitmap(bitmap_or_path)
    @bitmap_resized_default = Controller.create_resized_bitmap(@bitmap_default, @width, @height)
    @sprite.bitmap = @bitmap_resized_default
  end

  def set_image_down(bitmap_or_path)
    @bitmap_down = Controller.get_bitmap(bitmap_or_path)
    @bitmap_resized_down = Controller.create_resized_bitmap(@bitmap_down, @width, @height)
  end

  def set_image_left(bitmap_or_path)
    @bitmap_left = Controller.get_bitmap(bitmap_or_path)
    @bitmap_resized_left = Controller.create_resized_bitmap(@bitmap_left, @width, @height)
  end

  def set_image_right(bitmap_or_path)
    @bitmap_right = Controller.get_bitmap(bitmap_or_path)
    @bitmap_resized_right = Controller.create_resized_bitmap(@bitmap_right, @width, @height)
  end

  def set_image_up(bitmap_or_path)
    @bitmap_up = Controller.get_bitmap(bitmap_or_path)
    @bitmap_resized_up = Controller.create_resized_bitmap(@bitmap_up, @width, @height)
  end

  def set_image_stick(radius, bitmap_or_path)
    @stick_movable_radius = radius
    @bitmap_stick = Controller.get_bitmap(bitmap_or_path)
    @bitmap_resized_stick = Controller.create_resized_bitmap(@bitmap_stick, @width, @height)
    @sprite_stick.bitmap = @bitmap_resized_stick
    @sprite_stick.ox = @width / 2
    @sprite_stick.oy = @height / 2
    @stick_center_x = @sprite.x + @sprite_stick.ox
    @stick_center_y = @sprite.y + @sprite_stick.oy
    @sprite_stick.x = @stick_center_x
    @sprite_stick.y = @stick_center_y
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
    @sprite.bitmap = @bitmap_resized_default
    @sprite_stick.x = @stick_center_x
    @sprite_stick.y = @stick_center_y
    Controller.send_event(SDL::Event::KeyUp, @key, false)
    @key = nil
  end

  def event_touch_in(finger_id, x, y, type)
    case type
    when Controller::TouchType::DOWN, Controller::TouchType::DRAG
      @first_pressed = true
      dx = @sprite.x + @width / 2 - x
      dy = @sprite.y + @height / 2 - y
      angle = Math.atan2(dy, dx) * (180 / Math::PI)
      case angle
      when (-135.0...-45.0)
        @sprite.bitmap = @bitmap_resized_down
        sdl_key = SDL::Key::DOWN

      when (-45.0...45.0)
        @sprite.bitmap = @bitmap_resized_left
        sdl_key = SDL::Key::LEFT

      when (-180.0...-135.0), (135.0...180.0)
        @sprite.bitmap = @bitmap_resized_right
        sdl_key = SDL::Key::RIGHT

      when (45.0...135.0)
        @sprite.bitmap = @bitmap_resized_up
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
      @sprite.bitmap = @bitmap_resized_default
      @sprite_stick.x = @stick_center_x
      @sprite_stick.y = @stick_center_y
      Controller.send_event(SDL::Event::KeyUp, @key, false)
      @key = nil
      
    end
  end

end