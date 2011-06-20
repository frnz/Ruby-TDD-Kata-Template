class Generate < Thor

  def camelize(string)
		string.split("_").map(&:capitalize).join("")
  end

  desc "files", "Generate a class file"
  def files(filename)
			File.open("lib/#{filename}.rb", "w") do |file|
			  file.puts "class #{camelize filename}"
				file.puts "end"
			end
			File.open("spec/#{filename}_spec.rb", "w") do |file|
        file.puts 'require File.join(File.dirname(__FILE__), "../lib/string_calculator")'
				file.puts ''
			  file.puts "describe #{camelize filename} do"
				file.puts "end"
			end
	end
	
end
