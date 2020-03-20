#===============================================================================
if !$NEKO_RUBY.nil?
#-------------------------------------------------------------------------------
module SDL
  class << self
    alias_method(:handle_pad_touch, :handlePadTouch)
    def handlePadTouch(finger_id, unit_x, unit_y, touch_type)
      NekoControllerManager.listen(finger_id, unit_x, unit_y, touch_type) if !NekoControllerManager.entity.nil?
      handle_pad_touch(finger_id, unit_x, unit_y, touch_type)
    end
  end
end
#-------------------------------------------------------------------------------
end
#===============================================================================