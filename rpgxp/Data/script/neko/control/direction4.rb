#===============================================================================
if !$NEKO_RUBY.nil?
#-------------------------------------------------------------------------------
class NekoControl_Direction4 < NekoControl_Interface

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
    if @bitmap_default.nil?
      @bitmap_resized_default = NekoControllerManager.create_resized_default_bitmap(NekoControllerManager::ENV::SURFACE[:dpad_none], @width, @height)
    else
      @bitmap_resized_default = NekoControllerManager.create_resized_bitmap(@bitmap_default, @width, @height)
    end
    if @bitmap_down.nil?
      @bitmap_resized_down = NekoControllerManager.create_resized_default_bitmap(NekoControllerManager::ENV::SURFACE[:dpad_down], @width, @height)
    else
      @bitmap_resized_down = NekoControllerManager.create_resized_bitmap(@bitmap_down, @width, @height)
    end
    if @bitmap_left.nil?
      @bitmap_resized_left = NekoControllerManager.create_resized_default_bitmap(NekoControllerManager::ENV::SURFACE[:dpad_left], @width, @height)
    else
      @bitmap_resized_left = NekoControllerManager.create_resized_bitmap(@bitmap_left, @width, @height)
    end
    if @bitmap_right.nil?
      @bitmap_resized_right = NekoControllerManager.create_resized_default_bitmap(NekoControllerManager::ENV::SURFACE[:dpad_right], @width, @height)
    else
      @bitmap_resized_right = NekoControllerManager.create_resized_bitmap(@bitmap_right, @width, @height)
    end
    if @bitmap_up.nil?
      @bitmap_resized_up = NekoControllerManager.create_resized_default_bitmap(NekoControllerManager::ENV::SURFACE[:dpad_up], @width, @height)
    else
      @bitmap_resized_up = NekoControllerManager.create_resized_bitmap(@bitmap_up, @width, @height)
    end
    if @bitmap_stick.nil?
      @bitmap_resized_stick = NekoControllerManager.create_resized_default_bitmap(NekoControllerManager::ENV::SURFACE[:dpad_stick], @width, @height)
    else
      @bitmap_resized_stick = NekoControllerManager.create_resized_bitmap(@bitmap_stick, @width, @height)
    end
    @sprite.bitmap = @bitmap_resized_default
    @sprite_stick.bitmap = @bitmap_resized_stick
    @sprite_stick.ox = @width / 2
    @sprite_stick.oy = @height / 2
    @stick_center_x = @sprite.x + @sprite_stick.ox
    @stick_center_y = @sprite.y + @sprite_stick.oy
    @sprite_stick.x = @stick_center_x
    @sprite_stick.y = @stick_center_y
  end

  def set_image_default(bitmap_or_path)
    if bitmap_or_path.nil?
      @bitmap_default = nil
      @bitmap_resized_default = NekoControllerManager.create_resized_default_bitmap(NekoControllerManager::ENV::SURFACE[:dpad_none], @width, @height)
    else
      @bitmap_default = NekoControllerManager.get_bitmap(bitmap_or_path)
      @bitmap_resized_default = NekoControllerManager.create_resized_bitmap(@bitmap_default, @width, @height)
    end
    @sprite.bitmap = @bitmap_resized_default
  end

  def set_image_down(bitmap_or_path)
    if bitmap_or_path.nil?
      @bitmap_down = nil
      @bitmap_resized_down = NekoControllerManager.create_resized_default_bitmap(NekoControllerManager::ENV::SURFACE[:dpad_down], @width, @height)
    else
      @bitmap_down = NekoControllerManager.get_bitmap(bitmap_or_path)
      @bitmap_resized_down = NekoControllerManager.create_resized_bitmap(@bitmap_down, @width, @height)
    end
  end

  def set_image_left(bitmap_or_path)
    if bitmap_or_path.nil?
      @bitmap_left = nil
      @bitmap_resized_left = NekoControllerManager.create_resized_default_bitmap(NekoControllerManager::ENV::SURFACE[:dpad_left], @width, @height)
    else
      @bitmap_left = NekoControllerManager.get_bitmap(bitmap_or_path)
      @bitmap_resized_left = NekoControllerManager.create_resized_bitmap(@bitmap_left, @width, @height)
    end
  end

  def set_image_right(bitmap_or_path)
    if bitmap_or_path.nil?
      @bitmap_right = nil
      @bitmap_resized_right = NekoControllerManager.create_resized_default_bitmap(NekoControllerManager::ENV::SURFACE[:dpad_right], @width, @height)
    else
      @bitmap_right = NekoControllerManager.get_bitmap(bitmap_or_path)
      @bitmap_resized_right = NekoControllerManager.create_resized_bitmap(@bitmap_right, @width, @height)
    end
  end

  def set_image_up(bitmap_or_path)
    if bitmap_or_path.nil?
      @bitmap_up = nil
      @bitmap_resized_up = NekoControllerManager.create_resized_default_bitmap(NekoControllerManager::ENV::SURFACE[:dpad_up], @width, @height)
    else
      @bitmap_up = NekoControllerManager.get_bitmap(bitmap_or_path)
      @bitmap_resized_up = NekoControllerManager.create_resized_bitmap(@bitmap_up, @width, @height)
    end
  end

  def set_image_stick(bitmap_or_path)
    if bitmap_or_path.nil?
      @bitmap_stick = nil
      @bitmap_resized_stick = NekoControllerManager.create_resized_default_bitmap(NekoControllerManager::ENV::SURFACE[:dpad_stick], @width, @height)
    else
      @bitmap_stick = NekoControllerManager.get_bitmap(bitmap_or_path)
      @bitmap_resized_stick = NekoControllerManager.create_resized_bitmap(@bitmap_stick, @width, @height)
    end
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
    NekoControllerManager.send_event(SDL::Event::KeyUp, @key, false)
    @key = nil
  end

  def event_touch_in(finger_id, x, y, type)
    case type
    when NekoControllerManager::TouchType::DOWN, NekoControllerManager::TouchType::DRAG
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
        NekoControllerManager.send_event(SDL::Event::KeyUp, @key, false) if !@key.nil?
        @key = sdl_key
        NekoControllerManager.send_event(SDL::Event::KeyDown, @key, true)
      end
      move_stick(x, y) if @sprite_stick.visible && @sprite_stick.opacity > 0 && @stick_movable_radius > 0

    when NekoControllerManager::TouchType::UP
      @first_pressed = false
      @sprite.bitmap = @bitmap_resized_default
      @sprite_stick.x = @stick_center_x
      @sprite_stick.y = @stick_center_y
      NekoControllerManager.send_event(SDL::Event::KeyUp, @key, false)
      @key = nil
      
    end
  end
end
#-------------------------------------------------------------------------------
end
#===============================================================================