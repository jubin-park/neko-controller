class NekoControlContainer

  attr_reader(:container)

  def initialize
    @container = []
  end

  def add(control)
    control.sprite.visible = control.visible
    control.sprite_stick.visible = control.visible if defined? control.sprite_stick
    @container.push(control)
  end

  def remove(control)
    control.sprite.visible = false
    control.sprite_stick.visible = false if defined? control.sprite_stick
    @container.delete(control)
  end

  def clear
    for control in @container
      control.sprite.visible = false
      control.sprite_stick.visible = false if defined? control.sprite_stick
    end
    @container.clear
  end
end