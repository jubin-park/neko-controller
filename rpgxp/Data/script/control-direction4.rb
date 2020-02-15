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
    super([2, 4, 6, 8], x, y, z, rect_touchable)
    @sprite_stick = Sprite.new(Controller.viewport)
    @sprite_stick.z = @sprite.z + 1
    @sprite_stick.visible = false
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
    @sprite_stick.x = @sprite.x + (@sprite.bitmap.width - @bitmap_stick.width) / 2 + @sprite_stick.ox
    @sprite_stick.y = @sprite.y + (@sprite.bitmap.height - @bitmap_stick.height) / 2 + @sprite_stick.oy
    @sprite_stick.visible = true
  end

  def self.listen(finger_id, x, y, type, control)
    # send key event
    case type
    when TouchType::DOWN, TouchType::DRAG
      r = control.sprite.bitmap.width / 2
      dx = control.sprite.x + control.sprite.bitmap.width / 2 - x
      dy = control.sprite.y + control.sprite.bitmap.height / 2 - y
      #if (dx * dx + dy * dy < r * r)
        theta = Math.atan2(dy, dx) * (180 / Math::PI)
        case theta
        when (-90.0...-45.0), (-135.0...-90.0)
          control.sprite.bitmap = control.bitmap_down
        when (-45.0...0.0), (0.0...45.0)
          control.sprite.bitmap = control.bitmap_left
        when (-180.0...-135.0), (135.0...180.0)
          control.sprite.bitmap = control.bitmap_right
        when (45.0...90.0), (90.0...135.0)
          control.sprite.bitmap = control.bitmap_up
        end
      #end

    when TouchType::UP
      control.first_pressed = false
      control.sprite.bitmap = control.bitmap_default


    end
  end

end