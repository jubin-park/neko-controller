# encoding: utf-8
$:.unshift << File.dirname(__FILE__)

output = File.open("neko-controller.rb", "w+");
list = File.readlines("rpgxp/Data/script/main.rb")
list.each_index do |i|
	if list[i] =~ /^require \"(.*)\"/
		output.write File.read("rpgxp/Data/script/#{$1}.rb") << "\n"
		output.write "\n" if i < list.size - 1
	end
end
output.close