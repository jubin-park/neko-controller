#===============================================================================
if $NEKO_RUBY == 187 and RGSS.is_mobile?
#-------------------------------------------------------------------------------
module Touch
  @triggered_b = false
  @triggered_c = false
  @touch = []
  
  for i in 0..2
    @touch[i] = TouchData.new
  end
  
  class << self
    
    attr_accessor :triggered_b
    attr_accessor :triggered_c
    
    def [](fingerId)
      @touch[fingerId]
    end
    
    def updateTicks
      for fingerId in 0...@touch.size
        next if Touch[fingerId].start_ticks.nil? or Touch[fingerId].fingerUp?
        Touch[fingerId].increment_ticks = SDL.getTicks - Touch[fingerId].start_ticks
      end
    end
    
    def updateTriggerB
      if Touch[0].fingerDown?
        if Touch[1].fingerDown?
          if !Touch.triggered_b
            SDL.sendEvent(SDL::Event::KeyDown, SDL::Key::X, true)
            Touch.triggered_b = true
          end
        elsif Touch[1].fingerUp? or Touch[1].kind.nil?
          SDL.sendEvent(SDL::Event::KeyUp, SDL::Key::X, false)
          Touch.triggered_b = false
        end
      elsif Touch[0].fingerUp?
        SDL.sendEvent(SDL::Event::KeyUp, SDL::Key::X, false)
        Touch.triggered_b = false
      end
    end
    
    def update
      updateTicks
      #updateTriggerB
    end
  end
end
#-------------------------------------------------------------------------------
end
#===============================================================================