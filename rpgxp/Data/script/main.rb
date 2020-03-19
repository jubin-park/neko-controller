#$:.push(Dir.pwd + "/Data/script")
#require "main.rb"

require "kernel"
require "sdl"
require "sdl-key"
require "virtual-key"
require "input-nekoplayer"
require "input-windows"
require "rpg-cache"
require "controller"
require "control-interface"
require "control-keybutton"
require "control-direction4"
require "control-direction8"

SDL.showAlert("#{SDL::Key::GRAVE} #{Input::KB_TILDE}");

$button1 = ControlKeyButton.new(Input::KB_TILDE, 148, 348, 1, 192, 192)
$button1.set_image_default("Graphics/NekoControls/attack_0.png")
$button1.set_image_pressed("Graphics/NekoControls/attack_1.png")

=begin
$button2 = ControlKeyButton.new(Input::KB_TAB, 190, 348, 1, 96, 96)
$button2.set_image_default("Graphics/NekoControls/attack_0.png")
$button2.set_image_pressed("Graphics/NekoControls/attack_1.png")

$button3 = ControlKeyButton.new(Input::KB_ENTER, 182, 400, 2, 28, 28)
$button3.set_image_default(RPG::Cache.neko_control("default/UltimateDroidButton3"))
$button3.set_image_pressed(RPG::Cache.neko_control("default/UltimateDroidButton3Pressed"))
$button3.x = 0
$button3.y = 64
$button3.z = 90

$button4 = ControlKeyButton.new(Input::KB_ESCAPE, Graphics.width - 66, Graphics.height - 66, 2, 66, 66, true)
$button4.set_image_default(RPG::Cache.neko_control("default/UltimateDroidButton4.png"))
$button4.set_image_pressed(RPG::Cache.neko_control("default/UltimateDroidButton4Pressed"))
$button4.x = 32
$button4.y = 64
$button4.z = 90

$dpad = ControlDirection4.new(Graphics.width - 224, Graphics.height - 224, 0, 224, 224)
$dpad.set_image_default(RPG::Cache.neko_control("default/dpad_none"))
$dpad.set_image_down(RPG::Cache.neko_control("default/dpad_down"))
$dpad.set_image_left(RPG::Cache.neko_control("default/dpad_left"))
$dpad.set_image_right(RPG::Cache.neko_control("default/dpad_right"))
$dpad.set_image_up(RPG::Cache.neko_control("default/dpad_up"))
$dpad.set_image_stick(24, RPG::Cache.neko_control("default/dpad_stick"))
$dpad.resize(256, 180)

$dpad2 = ControlDirection4.new(Graphics.width - 224, Graphics.height - 224, 0, 224, 224)
$dpad2.set_image_default(RPG::Cache.neko_control("old/dpad_none"))
$dpad2.set_image_down(RPG::Cache.neko_control("old/dpad_down"))
$dpad2.set_image_left(RPG::Cache.neko_control("old/dpad_left"))
$dpad2.set_image_right(RPG::Cache.neko_control("old/dpad_right"))
$dpad2.set_image_up(RPG::Cache.neko_control("old/dpad_up"))
$dpad2.set_image_stick(12, RPG::Cache.neko_control("old/dpad_stick"))
#$dpad2.x = 250
#$dpad2.y = 250
#$dpad2.opacity = 128
#$dpad2.visible = false
=end

$dpad8 = ControlDirection8.new(150, 0, 0, 112, 156)
$dpad8.set_image_default(RPG::Cache.neko_control("default/dpad_none"))
$dpad8.set_image_lower_left(RPG::Cache.neko_control("default/dpad_lower_left"))
$dpad8.set_image_down(RPG::Cache.neko_control("default/dpad_down"))
$dpad8.set_image_lower_right(RPG::Cache.neko_control("default/dpad_lower_right"))
$dpad8.set_image_left(RPG::Cache.neko_control("default/dpad_left"))
$dpad8.set_image_right(RPG::Cache.neko_control("default/dpad_right"))
$dpad8.set_image_upper_left(RPG::Cache.neko_control("default/dpad_upper_left"))
$dpad8.set_image_up(RPG::Cache.neko_control("default/dpad_up"))
$dpad8.set_image_upper_right(RPG::Cache.neko_control("default/dpad_upper_right"))
$dpad8.set_image_stick(20, RPG::Cache.neko_control("default/dpad_stick"))
$dpad8.resize(224, 300)