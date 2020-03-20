# encoding: utf-8
$:.unshift << File.dirname(__FILE__)

output = File.open("neko-controller.rb", "w+");
list = File.read("src/main.rb")
list.each_line do |line|
	if line =~ /^require \"(.*)\"/
		output.write File.read("src/#{$1}.rb") << "\n\n";
	end
end
output.close