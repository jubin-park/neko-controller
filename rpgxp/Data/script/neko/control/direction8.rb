#===============================================================================
if !$NEKO_RUBY.nil?
#-------------------------------------------------------------------------------
class NekoControl_Direction8 < NekoControl_Interface

  attr_reader(:sprite_stick)
  attr_reader(:bitmap_default)
  attr_reader(:bitmap_lower_left)
  attr_reader(:bitmap_down)
  attr_reader(:bitmap_lower_right)
  attr_reader(:bitmap_left)
  attr_reader(:bitmap_right)
  attr_reader(:bitmap_upper_left)
  attr_reader(:bitmap_up)
  attr_reader(:bitmap_upper_right)
  attr_reader(:bitmap_stick)
  attr_reader(:bitmap_resized_default)
  attr_reader(:bitmap_resized_lower_left)
  attr_reader(:bitmap_resized_down)
  attr_reader(:bitmap_resized_lower_right)
  attr_reader(:bitmap_resized_left)
  attr_reader(:bitmap_resized_right)
  attr_reader(:bitmap_resized_upper_left)
  attr_reader(:bitmap_resized_up)
  attr_reader(:bitmap_resized_upper_right)
  attr_reader(:bitmap_resized_stick)
  attr_reader(:stick_movable_radius)

  def initialize(x, y, z, width, height, viewport)
    super([], x, y, z, width, height, viewport)
    @stick_movable_radius = 0
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

  def stick_movable_radius=(value)
    value = 0 if value < 0
    @stick_movable_radius = value
  end

  def resize(width, height)
    super(width, height)
    @bitmap_resized_default = NekoControllerManager.create_resized_bitmap(@bitmap_default, @width, @height)
    @bitmap_resized_lower_left = NekoControllerManager.create_resized_bitmap(@bitmap_lower_left, @width, @height)
    @bitmap_resized_down = NekoControllerManager.create_resized_bitmap(@bitmap_down, @width, @height)
    @bitmap_resized_lower_right = NekoControllerManager.create_resized_bitmap(@bitmap_lower_right, @width, @height)
    @bitmap_resized_left = NekoControllerManager.create_resized_bitmap(@bitmap_left, @width, @height)
    @bitmap_resized_right = NekoControllerManager.create_resized_bitmap(@bitmap_right, @width, @height)
    @bitmap_resized_upper_left = NekoControllerManager.create_resized_bitmap(@bitmap_upper_left, @width, @height)
    @bitmap_resized_up = NekoControllerManager.create_resized_bitmap(@bitmap_up, @width, @height)
    @bitmap_resized_upper_right = NekoControllerManager.create_resized_bitmap(@bitmap_upper_right, @width, @height)
    @sprite.bitmap = @bitmap_resized_default
    @bitmap_resized_stick = NekoControllerManager.create_resized_bitmap(@bitmap_stick, @width, @height)
    @sprite_stick.bitmap = @bitmap_resized_stick
    @sprite_stick.ox = @width / 2
    @sprite_stick.oy = @height / 2
    @stick_center_x = @sprite.x + @sprite_stick.ox
    @stick_center_y = @sprite.y + @sprite_stick.oy
    @sprite_stick.x = @stick_center_x
    @sprite_stick.y = @stick_center_y
  end

  def set_image_default(bitmap_or_path)
    @bitmap_default = NekoControllerManager.get_bitmap(bitmap_or_path)
    @bitmap_resized_default = NekoControllerManager.create_resized_bitmap(@bitmap_default, @width, @height)
    @sprite.bitmap = @bitmap_resized_default
  end

  def set_image_lower_left(bitmap_or_path)
    @bitmap_lower_left = NekoControllerManager.get_bitmap(bitmap_or_path)
    @bitmap_resized_lower_left = NekoControllerManager.create_resized_bitmap(@bitmap_lower_left, @width, @height)
  end

  def set_image_down(bitmap_or_path)
    @bitmap_down = NekoControllerManager.get_bitmap(bitmap_or_path)
    @bitmap_resized_down = NekoControllerManager.create_resized_bitmap(@bitmap_down, @width, @height)
  end

  def set_image_lower_right(bitmap_or_path)
    @bitmap_lower_right = NekoControllerManager.get_bitmap(bitmap_or_path)
    @bitmap_resized_lower_right = NekoControllerManager.create_resized_bitmap(@bitmap_lower_right, @width, @height)
  end

  def set_image_left(bitmap_or_path)
    @bitmap_left = NekoControllerManager.get_bitmap(bitmap_or_path)
    @bitmap_resized_left = NekoControllerManager.create_resized_bitmap(@bitmap_left, @width, @height)
  end

  def set_image_right(bitmap_or_path)
    @bitmap_right = NekoControllerManager.get_bitmap(bitmap_or_path)
    @bitmap_resized_right = NekoControllerManager.create_resized_bitmap(@bitmap_right, @width, @height)
  end

  def set_image_upper_left(bitmap_or_path)
    @bitmap_upper_left = NekoControllerManager.get_bitmap(bitmap_or_path)
    @bitmap_resized_upper_left = NekoControllerManager.create_resized_bitmap(@bitmap_upper_left, @width, @height)
  end

  def set_image_up(bitmap_or_path)
    @bitmap_up = NekoControllerManager.get_bitmap(bitmap_or_path)
    @bitmap_resized_up = NekoControllerManager.create_resized_bitmap(@bitmap_up, @width, @height)
  end

  def set_image_upper_right(bitmap_or_path)
    @bitmap_upper_right = NekoControllerManager.get_bitmap(bitmap_or_path)
    @bitmap_resized_upper_right = NekoControllerManager.create_resized_bitmap(@bitmap_upper_right, @width, @height)
  end

  def set_image_stick(bitmap_or_path)
    @bitmap_stick = NekoControllerManager.get_bitmap(bitmap_or_path)
    @bitmap_resized_stick = NekoControllerManager.create_resized_bitmap(@bitmap_stick, @width, @height)
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
    @key.each { |k| NekoControllerManager.send_event(SDL::Event::KeyUp, k, false) }
    @key = []
  end

  def event_touch_in(finger_id, x, y, type)
    case type
    when NekoControllerManager::TouchType::DOWN, NekoControllerManager::TouchType::DRAG
      @first_pressed = true
      dx = @sprite.x + @width / 2 - x
      dy = @sprite.y + @height / 2 - y
      angle = Math.atan2(dy, dx) * (180 / Math::PI)
      case angle
      when (-67.5...-22.5)
        @sprite.bitmap = @bitmap_resized_lower_left
        sdl_key = [SDL::Key::DOWN, SDL::Key::LEFT]

      when (-112.5...-67.5)
        @sprite.bitmap = @bitmap_resized_down
        sdl_key = [SDL::Key::DOWN]

      when (-157.5...-112.5)
        @sprite.bitmap = @bitmap_resized_lower_right
        sdl_key = [SDL::Key::DOWN, SDL::Key::RIGHT]

      when (-22.5...22.5)
        @sprite.bitmap = @bitmap_resized_left
        sdl_key = [SDL::Key::LEFT]

      when (-180.0...-157.5), (157.5...180.0)
        @sprite.bitmap = @bitmap_resized_right
        sdl_key = [SDL::Key::RIGHT]

      when (22.5...67.5)
        @sprite.bitmap = @bitmap_resized_upper_left
        sdl_key = [SDL::Key::UP, SDL::Key::LEFT]

      when (67.5...112.5)
        @sprite.bitmap = @bitmap_resized_up
        sdl_key = [SDL::Key::UP]
        
      when (112.5...157.5)
        @sprite.bitmap = @bitmap_resized_upper_right
        sdl_key = [SDL::Key::UP, SDL::Key::RIGHT]
      end
      if @key != sdl_key
        @key.each { |k| NekoControllerManager.send_event(SDL::Event::KeyUp, k, false) }
        @key = sdl_key
        @key.each { |k| NekoControllerManager.send_event(SDL::Event::KeyDown, k, true) }
      end
      move_stick(x, y) if @sprite_stick.visible && @sprite_stick.opacity > 0 && @stick_movable_radius > 0

    when NekoControllerManager::TouchType::UP
      @first_pressed = false
      @sprite.bitmap = @bitmap_resized_default
      @sprite_stick.x = @stick_center_x
      @sprite_stick.y = @stick_center_y
      @key.each { |k| NekoControllerManager.send_event(SDL::Event::KeyUp, k, false) }
      @key = []

    end
  end
end
#-------------------------------------------------------------------------------
end
#===============================================================================