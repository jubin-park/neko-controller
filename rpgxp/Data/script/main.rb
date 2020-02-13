#$:.push(Dir.pwd + "/Data/script")
#require "main.rb"

require "kernel"
require "sdl"
#require "sdl-key"
require "rpg-cache"
require "control-interface"
require "control-button"
require "controller"

$button1 = ControlButton.new(SDL::Key::F2, 128, 128, 1, "Graphics/NekoControls/attack_0.png")
$button2 = ControlButton.new(SDL::Key::RIGHT, 200, 128, 1, "Graphics/NekoControls/attack_1.png")
$button3 = ControlButton.new(SDL::Key::ESCAPE, 0, 0, 1, RPG::Cache.neko_control("dpad_menu.png"))