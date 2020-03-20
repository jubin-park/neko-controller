=begin
title  TestController

author neko-player-control-editor
date   2020.03.20
syntax ruby
pltfrm android (neko player)
=end
#===============================================================================
if !$NEKO_RUBY.nil?
#-------------------------------------------------------------------------------
class TestController < NekoController_Template

  attr_reader(:key_0)
  attr_reader(:key_1)
  attr_reader(:key_2)
  attr_reader(:key_3)
  attr_reader(:dpad8_0)

  def initialize
    super
    @key_0 = NekoControl_KeyButton.new(Input::KB_TILDE, 20, 332, 0, 66, 66, @viewport)
    @key_0.set_image_default(RPG::Cache.neko_control("default/UltimateDroidButton1.png"))
    @key_0.set_image_pressed(RPG::Cache.neko_control("default/UltimateDroidButton1Pressed.png"))
    @key_0.rect_touchable = false
    @controls.add(@key_0)

    @key_1 = NekoControl_KeyButton.new(Input::KB_TAB, 100, 332, 0, 66, 66, @viewport)
    @key_1.set_image_default(RPG::Cache.neko_control("default/UltimateDroidButton2.png"))
    @key_1.set_image_pressed(RPG::Cache.neko_control("default/UltimateDroidButton2Pressed.png"))
    @key_1.rect_touchable = false
    @controls.add(@key_1)

    @key_2 = NekoControl_KeyButton.new(Input::KB_ENTER, 21, 400, 0, 66, 66, @viewport)
    @key_2.set_image_default(RPG::Cache.neko_control("default/UltimateDroidButton3.png"))
    @key_2.set_image_pressed(RPG::Cache.neko_control("default/UltimateDroidButton3Pressed.png"))
    @key_2.rect_touchable = false
    @controls.add(@key_2)

    @key_3 = NekoControl_KeyButton.new(Input::KB_ESCAPE, 100, 400, 0, 66, 66, @viewport)
    @key_3.set_image_default(RPG::Cache.neko_control("default/UltimateDroidButton4.png"))
    @key_3.set_image_pressed(RPG::Cache.neko_control("default/UltimateDroidButton4Pressed.png"))
    @key_3.rect_touchable = false
    @controls.add(@key_3)

    @dpad8_0 = NekoControl_Direction8.new(430, 269, 0, 224, 224, @viewport)
    @dpad8_0.set_image_default(RPG::Cache.neko_control("default/dpad_none.png"))
    @dpad8_0.set_image_lower_left(RPG::Cache.neko_control("default/dpad_lower_left.png"))
    @dpad8_0.set_image_down(RPG::Cache.neko_control("default/dpad_down.png"))
    @dpad8_0.set_image_lower_right(RPG::Cache.neko_control("default/dpad_lower_right.png"))
    @dpad8_0.set_image_left(RPG::Cache.neko_control("default/dpad_left.png"))
    @dpad8_0.set_image_right(RPG::Cache.neko_control("default/dpad_right.png"))
    @dpad8_0.set_image_upper_left(RPG::Cache.neko_control("default/dpad_upper_left.png"))
    @dpad8_0.set_image_up(RPG::Cache.neko_control("default/dpad_up.png"))
    @dpad8_0.set_image_upper_right(RPG::Cache.neko_control("default/dpad_upper_right.png"))
    @dpad8_0.set_image_stick(64, RPG::Cache.neko_control("default/dpad_stick.png"))
    @dpad8_0.rect_touchable = true
    @controls.add(@dpad8_0)
  end
end

NekoControllerManager.entity = TestController.new

#-------------------------------------------------------------------------------
end
#===============================================================================