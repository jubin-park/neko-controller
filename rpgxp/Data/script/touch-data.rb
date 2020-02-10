#===============================================================================
if $NEKO_RUBY == 187 and RGSS.is_mobile?
#-------------------------------------------------------------------------------
class TouchData
    
  attr_accessor :x, :y, :ux, :uy, :kind, :start_ticks, :increment_ticks
  attr_accessor :triggered
  
  def initialize
    @x = 0
    @y = 0
    @ux = 0
    @uy = 0
    @kind = 1
    @start_ticks = nil
    @increment_ticks = 0
    @triggered = false
    @phase = 0
    @oldq = nil
  end
  
  def fingerDown?
    return @kind == 0
  end
  
  def fingerUp?
    return @kind == 1
  end
  
  def fingerDrag?
    return @kind == 2
  end
  
  def fingerTrigger?
    if fingerDown? || fingerDrag?
      if !@triggered
        @triggered = true
        return true
      else
        return false
      end
    end
    @triggered = false
  end
  
  def fingerPress?(delay=100)
    if @kind == 1
      @oldq = nil
      return false
    end
    if fingerDown? || fingerDrag?
      delay = delay.to_i
      q = @increment_ticks / delay
      if q != @oldq
        @oldq = q
        return true
      end
    end
  end
    
  def fingerInSprite?(sprite)
    return false if !sprite.is_a?(Sprite)
    return false if !sprite.visible
    return false if sprite.opacity.zero?
    if @x + sprite.ox * sprite.zoom_x >= sprite.x && 
      @x + sprite.ox * sprite.zoom_x < sprite.x + sprite.bitmap.width * sprite.zoom_x &&
      @y + sprite.oy * sprite.zoom_y >= sprite.y &&
      @y + sprite.oy * sprite.zoom_y < sprite.y + sprite.bitmap.height * sprite.zoom_y
      return true
    end
  end
  
end
#-------------------------------------------------------------------------------
end
#===============================================================================