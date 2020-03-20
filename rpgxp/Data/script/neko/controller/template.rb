#===============================================================================
if !$NEKO_RUBY.nil?
#-------------------------------------------------------------------------------
class NekoController_Template

  attr_reader(:viewport)
  attr_reader(:controls)

  def initialize
    @controls = NekoControlContainer.new
    @viewport = Viewport.new(0, 0, NekoControllerManager::SCREEN_WIDTH, NekoControllerManager::SCREEN_HEIGHT)
    @viewport.z = (1 << 31) - 1
  end
end
#-------------------------------------------------------------------------------
end
#===============================================================================