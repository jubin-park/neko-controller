#===============================================================================
if !$NEKO_RUBY.nil?
#-------------------------------------------------------------------------------
class NekoControl_KeyButton < NekoControl_Interface

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
    if @bitmap_default.nil?
      @bitmap_resized_default = NekoControllerManager.create_resized_default_bitmap(NekoControllerManager::ENV::SURFACE[:UltimateDroidButton3], @width, @height)
    else
      @bitmap_resized_default = NekoControllerManager.create_resized_bitmap(@bitmap_default, @width, @height)
    end
    if @bitmap_pressed.nil?
      @bitmap_resized_pressed = NekoControllerManager.create_resized_default_bitmap(NekoControllerManager::ENV::SURFACE[:UltimateDroidButton3Pressed], @width, @height)
    else
      @bitmap_resized_pressed = NekoControllerManager.create_resized_bitmap(@bitmap_pressed, @width, @height)
    end
    @sprite.bitmap = @bitmap_resized_default
  end

  def set_image_default(bitmap_or_path)
    if bitmap_or_path.nil?
      @bitmap_default = nil
      @bitmap_resized_default = NekoControllerManager.create_resized_default_bitmap(NekoControllerManager::ENV::SURFACE[:UltimateDroidButton3], @width, @height)
    else
      @bitmap_default = NekoControllerManager.get_bitmap(bitmap_or_path)
      @bitmap_resized_default = NekoControllerManager.create_resized_bitmap(@bitmap_default, @width, @height)
    end
    @sprite.bitmap = @bitmap_resized_default
  end

  def set_image_pressed(bitmap_or_path)
    if bitmap_or_path.nil?
      @bitmap_pressed = nil
      @bitmap_resized_pressed = NekoControllerManager.create_resized_default_bitmap(NekoControllerManager::ENV::SURFACE[:UltimateDroidButton3Pressed], @width, @height)
    else
      @bitmap_pressed = NekoControllerManager.get_bitmap(bitmap_or_path)
      @bitmap_resized_pressed = NekoControllerManager.create_resized_bitmap(@bitmap_pressed, @width, @height)
    end
  end

  def event_touch_over(finger_id, x, y, type)
    super(finger_id, x, y, type)
    @sprite.bitmap = @bitmap_resized_default
    NekoControllerManager.send_event(SDL::Event::KeyUp, @key, false)
  end

  def event_touch_in(finger_id, x, y, type)
    case type
    when NekoControllerManager::TouchType::DOWN
      @first_pressed = true
      @sprite.bitmap = @bitmap_resized_pressed
      NekoControllerManager.send_event(SDL::Event::KeyDown, @key, true)

    when NekoControllerManager::TouchType::UP
      @first_pressed = false
      @sprite.bitmap = @bitmap_resized_default
      NekoControllerManager.send_event(SDL::Event::KeyUp, @key, false)

    when NekoControllerManager::TouchType::DRAG
    end
  end
end
#-------------------------------------------------------------------------------
end
#===============================================================================