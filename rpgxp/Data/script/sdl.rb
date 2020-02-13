#===============================================================================
if $NEKO_RUBY == 187 and RGSS.is_mobile?
#-------------------------------------------------------------------------------
module SDL
  class << self
    alias_method(:handle_pad_touch, :handlePadTouch)
    def handlePadTouch(finger_id, unit_x, unit_y, touch_type)
      Controller.listen(finger_id, unit_x, unit_y, touch_type)
      handle_pad_touch(finger_id, unit_x, unit_y, touch_type)
    end
  end
end
#-------------------------------------------------------------------------------
end
#===============================================================================