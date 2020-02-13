#$:.push(Dir.pwd + "/Data/script")
#require "main.rb"

require "kernel"
require "sdl"
#require "sdl-key"
require "rpg-cache"
require "control-interface"
require "control-button"
require "controller"

$button1 = ControlButton.new(SDL::Key::LEFT, 128, 128, 1)
$button1.set_image_default("Graphics/NekoControls/attack_0.png")
$button1.set_image_pressed("Graphics/NekoControls/attack_1.png")

$button2 = ControlButton.new(SDL::Key::RIGHT, 200, 128, 1)
$button2.set_image_default("Graphics/NekoControls/attack_0.png")
$button2.set_image_pressed("Graphics/NekoControls/attack_1.png")

$button3 = ControlButton.new(SDL::Key::ESCAPE, 640 - 66, 480 - 66, 1, false)
$button3.set_image_default(RPG::Cache.neko_control("UltimateDroidButton4.png"))
$button3.set_image_pressed(RPG::Cache.neko_control("UltimateDroidButton4Pressed"))