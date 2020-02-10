#===============================================================================
if $NEKO_RUBY == 187 and RGSS.is_mobile?
#-------------------------------------------------------------------------------
module SDL
  class << self
    alias :_handlePadTouch :handlePadTouch
    def handlePadTouch(fingerId, unitX, unitY, touchType)
      dw, dh = Device.width.to_f, Device.height.to_f
      gw, gh = Graphics.width.to_f, Graphics.height.to_f
      r = dh / gh
      gw2 = gw * r
      ew2 = (dw - gw2) / 2
      r2 = dw / gw2
      begin
        Touch[fingerId].ux = unitX
        Touch[fingerId].uy = unitY
        Touch[fingerId].x = ( Touch[fingerId].ux - (ew2 / dw.to_f) ) * gw * r2
        Touch[fingerId].y = ( Touch[fingerId].uy * gh )
        Touch[fingerId].kind = touchType
        if touchType == 0 || touchType == 2
          Touch[fingerId].start_ticks ||= SDL.getTicks
        elsif touchType == 1
          #Touch[fingerId].ux = Touch[fingerId].uy = Touch[fingerId].x = Touch[fingerId].y = nil
          Touch[fingerId].start_ticks = nil
          Touch[fingerId].increment_ticks = 0
        end
      rescue NoMethodError # Touch[fingerId].nil?
      ensure
        _handlePadTouch(fingerId, unitX, unitY, touchType)
      end
    end
    
    def sendEvent(event, sym, press)
      e = event.new
      e.press = press
      e.repeat = 0
      e.mod = 0
      e.sym = sym
      Input.events << e
    end
  end
end

class SDL::Event::KeyUp
  attr_accessor :scancode
  def initialize
    @scancode = 0
  end
end
#-------------------------------------------------------------------------------
end
#===============================================================================