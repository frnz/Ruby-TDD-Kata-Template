class Generate < Thor

  desc "files", "Generate a class file"
  def files(filename)
			File.open("lib/#{filename}.rb", "w") do |file|
			  file.puts "class #{filename.capitalize}"
				file.puts "end"
			end
			File.open("spec/#{filename}_spec.rb", "w") do |file|
        file.puts 'require File.join(File.dirname(__FILE__), "../lib/string_calculator")'
				file.puts ''
			  file.puts "describe #{filename.capitalize} do"
				file.puts "end"
			end
	end
	
end
