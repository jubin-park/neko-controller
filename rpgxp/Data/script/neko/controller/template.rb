#===============================================================================
if !$NEKO_RUBY.nil?
#-------------------------------------------------------------------------------
class NekoController_Template

  attr_reader(:viewport)
  attr_reader(:controls)

  def initialize
    @controls = NekoControlContainer.new
    # Viewport#visible method does not work.
    #@viewport = Viewport.new(0, 0, NekoControllerManager::SCREEN_WIDTH, NekoControllerManager::SCREEN_HEIGHT)
    @viewport = Viewport.new(-1, -1, 1, 1)
    @viewport.z = (1 << 31) - 1
  end

  def visible=(value)
    if value == true
      @viewport.rect.x = 0
      @viewport.rect.y = 0
      @viewport.rect.width = NekoControllerManager::SCREEN_WIDTH
      @viewport.rect.height = NekoControllerManager::SCREEN_HEIGHT
    elsif value == false
      @viewport.rect.x = -1
      @viewport.rect.y = -1
      @viewport.rect.width = 1
      @viewport.rect.height = 1
    end
  end
end
#-------------------------------------------------------------------------------
end
#===============================================================================