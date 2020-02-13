#$:.push(Dir.pwd + "/Data/script")
#require "main.rb"

require "kernel"
require "sdl"
#require "sdl-key"
require "rpg-cache"
require "controller"
require "control-interface"
require "control-button"
require "control-direction4"


$button1 = ControlButton.new(SDL::Key::LEFT, 128, 128, 1)
$button1.set_image_default("Graphics/NekoControls/attack_0.png")
$button1.set_image_pressed("Graphics/NekoControls/attack_1.png")

$button2 = ControlButton.new(SDL::Key::RIGHT, 170, 128, 1)
$button2.set_image_default("Graphics/NekoControls/attack_0.png")
$button2.set_image_pressed("Graphics/NekoControls/attack_1.png")

$button3 = ControlButton.new(SDL::Key::ESCAPE, Graphics.width - 66, Graphics.height - 66, 2, true)
$button3.set_image_default(RPG::Cache.neko_control("UltimateDroidButton4.png"))
$button3.set_image_pressed(RPG::Cache.neko_control("UltimateDroidButton4Pressed"))

$dpad = ControlDirection4.new(0, Graphics.height - 224, 5)
$dpad.set_image_default(RPG::Cache.neko_control("dpad_none"))
$dpad.set_image_down(RPG::Cache.neko_control("dpad_down"))
$dpad.set_image_left(RPG::Cache.neko_control("dpad_left"))
$dpad.set_image_right(RPG::Cache.neko_control("dpad_right"))
$dpad.set_image_up(RPG::Cache.neko_control("dpad_up"))
$dpad.set_image_stick(16, RPG::Cache.neko_control("dpad_stick"))