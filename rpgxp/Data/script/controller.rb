#===============================================================================
if $NEKO_RUBY == 187 and RGSS.is_mobile?
#-------------------------------------------------------------------------------
module RPG::Cache
  def self.dpad(filename)
    self.load_bitmap("Graphics/DPAD/", filename)
  end
end

module DPADEX
  # Get Environment Variables
  DPAD_SCALE = SDL.getenv("DPAD_SCALE").to_f
  DPAD_BUTTON_SCALE = 2.5
  DPAD_OPACITY = SDL.getenv("DPAD_OPACITY").to_i
  # scancode => keycode
  # A : 4 => 0x61
  # S : 22 => 0x73
  # RETURN : 40 => 0x0D
  # ESCAPE : 41 => 0x1B
  # LSHFT : 225 => 0x800000E1
  keycode = {4=>0x61, 22=>0x73, 40=>0x0D, 41=>0x1B, 225=>0x800000E1}
  KEY_1 = keycode[SDL.getenv("KEY_1").to_i]
  KEY_2 = keycode[SDL.getenv("KEY_2").to_i]
  KEY_3 = keycode[SDL.getenv("KEY_3").to_i]
  KEY_4 = keycode[SDL.getenv("KEY_4").to_i]
  SDL.putenv("DPAD_SCALE=0") # DO NOT REMOVE !
end
  
module DPADEX
  
  KEY_5 = SDL::Key::LCTRL#SDL::Key::S
  
  module_function
  def init
    # Viewport
    @@viewport = Viewport.new(0, 0, Graphics.width, Graphics.height)
    @@viewport.z = 999999999
    # Bitmap
    @@bmp = Hash.new
    for f in ["dpad_down", "dpad_left", "dpad_none", "dpad_right", "dpad_stick", "dpad_up", "UltimateDroidButton1", "UltimateDroidButton1Pressed", "UltimateDroidButton2", "UltimateDroidButton2Pressed"]
      k = f.to_sym
      srfc = SDL::Surface.load(f + ".png")
      srfc.setColorKey( srfc.mapRGBA(0, 0, 0, 0) )
      @@bmp[k] = Bitmap.new(srfc.w, srfc.h)
      SDL::Surface.blit(srfc, 0, 0, srfc.w, srfc.h, @@bmp[k].entity, 0, 0)
      srfc.destroy if !srfc.destroyed?
    end
    @@bmp[:dpad_menu] = RPG::Cache.dpad("dpad_menu.png")
    @@bmp[:key5_0] = RPG::Cache.dpad("key5_0.png")
    @@bmp[:key5_1] = RPG::Cache.dpad("key5_1.png")
    # Sprite
    @@spr = Hash.new
    # dpad_direction
    @@spr[:dpad_dir] = Sprite.new(@@viewport)
    @@spr[:dpad_dir].bitmap = @@bmp[:dpad_none]
    @@spr[:dpad_dir].zoom_x = DPAD_SCALE
    @@spr[:dpad_dir].zoom_y = DPAD_SCALE
    @@spr[:dpad_dir].opacity = DPAD_OPACITY
    @@spr[:dpad_dir].set_cg
    @@spr[:dpad_dir].x = @@spr[:dpad_dir].ox * DPAD_SCALE
    @@spr[:dpad_dir].y = Graphics.height - (@@bmp[:dpad_none].height - @@spr[:dpad_dir].oy) * DPAD_SCALE
    # dpad_stickBall
    @@spr[:dpad_stick] = Sprite.new(@@viewport)
    @@spr[:dpad_stick].bitmap = @@bmp[:dpad_stick]
    @@spr[:dpad_stick].zoom_x = DPAD_SCALE
    @@spr[:dpad_stick].zoom_y = DPAD_SCALE
    @@spr[:dpad_stick].opacity = DPAD_OPACITY
    @@spr[:dpad_stick].set_cg
    @@spr[:dpad_stick].x = @@spr[:dpad_stick].ox * DPAD_SCALE
    @@spr[:dpad_stick].y = Graphics.height - (@@bmp[:dpad_stick].height - @@spr[:dpad_stick].oy) * DPAD_SCALE
    # dpad_keyButton
    
    @@spr[:dpad_key4] = Sprite.new(@@viewport)
    @@spr[:dpad_key4].bitmap = @@bmp[:UltimateDroidButton2]
    @@spr[:dpad_key4].zoom_x = DPAD_SCALE * DPAD_BUTTON_SCALE
    @@spr[:dpad_key4].zoom_y = DPAD_SCALE * DPAD_BUTTON_SCALE
    @@spr[:dpad_key4].set_cg
    stdx = Graphics.width - @@spr[:dpad_key4].bitmap.width * DPAD_SCALE * DPAD_BUTTON_SCALE / 2
    stdy = Graphics.height - @@spr[:dpad_key4].bitmap.height * DPAD_SCALE * DPAD_BUTTON_SCALE / 2
    @@spr[:dpad_key4].x = stdx
    @@spr[:dpad_key4].y = stdy
    @@spr[:dpad_key4].opacity = DPAD_OPACITY
    
    @@spr[:dpad_key3] = Sprite.new(@@viewport)
    @@spr[:dpad_key3].bitmap = @@bmp[:UltimateDroidButton1]
    @@spr[:dpad_key3].zoom_x = DPAD_SCALE * DPAD_BUTTON_SCALE
    @@spr[:dpad_key3].zoom_y = DPAD_SCALE * DPAD_BUTTON_SCALE
    @@spr[:dpad_key3].set_cg
    @@spr[:dpad_key3].x = stdx - @@spr[:dpad_key3].bitmap.width * DPAD_SCALE * DPAD_BUTTON_SCALE
    @@spr[:dpad_key3].y = stdy
    @@spr[:dpad_key3].opacity = DPAD_OPACITY

    @@spr[:dpad_key2] = Sprite.new(@@viewport)
    @@spr[:dpad_key2].bitmap = @@bmp[:UltimateDroidButton2]
    @@spr[:dpad_key2].zoom_x = DPAD_SCALE * DPAD_BUTTON_SCALE
    @@spr[:dpad_key2].zoom_y = DPAD_SCALE * DPAD_BUTTON_SCALE
    @@spr[:dpad_key2].set_cg
    @@spr[:dpad_key2].x = stdx
    @@spr[:dpad_key2].y = stdy - @@spr[:dpad_key2].bitmap.height * DPAD_SCALE * DPAD_BUTTON_SCALE
    @@spr[:dpad_key2].opacity = DPAD_OPACITY
    
    @@spr[:dpad_key1] = Sprite.new(@@viewport)
    @@spr[:dpad_key1].bitmap = @@bmp[:UltimateDroidButton1]
    @@spr[:dpad_key1].zoom_x = DPAD_SCALE * DPAD_BUTTON_SCALE
    @@spr[:dpad_key1].zoom_y = DPAD_SCALE * DPAD_BUTTON_SCALE
    @@spr[:dpad_key1].set_cg
    @@spr[:dpad_key1].x = stdx - @@spr[:dpad_key1].bitmap.width * DPAD_SCALE * DPAD_BUTTON_SCALE
    @@spr[:dpad_key1].y = stdy - @@spr[:dpad_key1].bitmap.height * DPAD_SCALE * DPAD_BUTTON_SCALE
    @@spr[:dpad_key1].opacity = DPAD_OPACITY
    
    @@spr[:dpad_key5] = Sprite.new(@@viewport)
    @@spr[:dpad_key5].bitmap = @@bmp[:key5_0]
    #@@spr[:dpad_key5].zoom_x = DPAD_SCALE * DPAD_BUTTON_SCALE
    #@@spr[:dpad_key5].zoom_y = DPAD_SCALE * DPAD_BUTTON_SCALE
    @@spr[:dpad_key5].set_cg
    @@spr[:dpad_key5].x = stdx - 144
    @@spr[:dpad_key5].y = stdy - 64
    @@spr[:dpad_key5].opacity = DPAD_OPACITY
    
    # Menu
    @@spr[:dpad_menu] = Sprite.new(@@viewport)
    @@spr[:dpad_menu].bitmap = @@bmp[:dpad_menu]
    @@spr[:dpad_menu].opacity = DPAD_OPACITY
  end
  
  def update  
    key = getDirKey()
    if Touch[0].fingerPress?
      if key != nil
        SDL.sendEvent(SDL::Event::KeyUp, SDL::Key::RIGHT, false)
        SDL.sendEvent(SDL::Event::KeyUp, SDL::Key::LEFT, false)
        SDL.sendEvent(SDL::Event::KeyUp, SDL::Key::UP, false)
        SDL.sendEvent(SDL::Event::KeyUp, SDL::Key::DOWN, false)
        SDL.sendEvent(SDL::Event::KeyDown, key, true)
      end
    end
    updateKeyButton(@@spr[:dpad_key1], @@bmp[:UltimateDroidButton1], @@bmp[:UltimateDroidButton1Pressed], KEY_1)
    updateKeyButton(@@spr[:dpad_key2], @@bmp[:UltimateDroidButton2], @@bmp[:UltimateDroidButton2Pressed], KEY_2)
    updateKeyButton(@@spr[:dpad_key3], @@bmp[:UltimateDroidButton1], @@bmp[:UltimateDroidButton1Pressed], KEY_3)
    updateKeyButton(@@spr[:dpad_key4], @@bmp[:UltimateDroidButton2], @@bmp[:UltimateDroidButton2Pressed], KEY_4)
    updateKeyButton(@@spr[:dpad_key5], @@bmp[:key5_0], @@bmp[:key5_1], KEY_5)
    
    if Input.trigger?(Input::Entities[KEY_5])
      msgbox "CTRL 키 누름"
    end
    
    if Touch[0].fingerInSprite?(@@spr[:dpad_menu])
      @@spr[:dpad_menu].opacity += 5
      @@spr[:dpad_menu].opacity = 255 if @@spr[:dpad_menu].opacity > 255
      if Touch[0].fingerTrigger?
        p "Menu"
      end
    else
      @@spr[:dpad_menu].opacity -= 5
      @@spr[:dpad_menu].opacity = DPAD_OPACITY if @@spr[:dpad_menu].opacity < DPAD_OPACITY 
    end

  end

  def updateKeyButton(spr, bmp_up, bmp_down, key)
    if Touch[0].fingerDown?
      if Touch[0].fingerInSprite?(spr)
        spr.bitmap = bmp_down
      else
        spr.bitmap = bmp_up
      end
    else
      spr.bitmap = bmp_up
    end
    if Touch[0].fingerInSprite?(spr)
      if Touch[0].fingerTrigger?
        SDL.sendEvent(SDL::Event::KeyDown, key, true)
      else
        SDL.sendEvent(SDL::Event::KeyUp, key, false)
      end
    else
      SDL.sendEvent(SDL::Event::KeyUp, key, false)
    end
  end
  
  def getDirKey
    r = DPAD_SCALE * @@bmp[:dpad_none].width / 2
    x0 = @@spr[:dpad_dir].x.to_f
    y0 = @@spr[:dpad_dir].y.to_f
    x1 = Touch[0].x.to_f
    y1 = Touch[0].y.to_f
    if Touch[0].fingerDown? || Touch[0].fingerDrag?
      if (( x0-x1 ) * ( x0-x1 ) + ( y0-y1 ) * ( y0-y1 )) <= ( r*r )
        theta = Math.atan2(y0-y1, x0-x1) * (180 / Math::PI)
        case theta
        when (-180.0...-135.0), (135.0...180.0)
          @@spr[:dpad_dir].bitmap = @@bmp[:dpad_right]
          return SDL::Key::RIGHT
        when (-45.0...0.0), (0.0...45.0)
          @@spr[:dpad_dir].bitmap = @@bmp[:dpad_left]
          return SDL::Key::LEFT
        when (45.0...90.0), (90.0...135.0)
          @@spr[:dpad_dir].bitmap = @@bmp[:dpad_up]
          return SDL::Key::UP
        when (-90.0...-45.0), (-135.0...-90.0)
          @@spr[:dpad_dir].bitmap = @@bmp[:dpad_down]
          return SDL::Key::DOWN
        else
          @@spr[:dpad_dir].bitmap = @@bmp[:dpad_none]
          for ikey in ([SDL::Key::RIGHT, SDL::Key::LEFT, SDL::Key::UP, SDL::Key::DOWN])
            SDL.sendEvent(SDL::Event::KeyUp, ikey, false)
          end
          return nil
        end
      else
        @@spr[:dpad_dir].bitmap = @@bmp[:dpad_none]
        for ikey in ([SDL::Key::RIGHT, SDL::Key::LEFT, SDL::Key::UP, SDL::Key::DOWN])
          SDL.sendEvent(SDL::Event::KeyUp, ikey, false)
        end
        return nil
      end
    else
      @@spr[:dpad_dir].bitmap = @@bmp[:dpad_none]
      for ikey in ([SDL::Key::RIGHT, SDL::Key::LEFT, SDL::Key::UP, SDL::Key::DOWN])
        SDL.sendEvent(SDL::Event::KeyUp, ikey, false)
      end
      return nil
    end
  end  
  init()
end
#-------------------------------------------------------------------------------
end
#===============================================================================