module Shubox
  class TestUnitCleaner
    
    def run(args)
      if (%w(-h --help).include?(args.first) || args.empty?)
        puts usage
        exit(0)
      end

      dir = ARGV.first

      files = Dir["#{dir}/test/**/test_*.rb"].each do |file|
        unless file.match(/test_helper.rb/)
          puts "cleaning: #{file}"
          clean(file)
        end
      end
    end
    
    def clean(filename)
      lines = File.readlines(filename)
      output = []
      outside_class = true
      lines.each do |line|
        if outside_class
          output << line
        elsif line.match(/^\s*def test_/)
          output << line
          output << "  end\n"
        end
        if line.match(/class [a-zA-Z]\S* < Test::Unit::TestCase/)
          outside_class = false
        end
      end
      output << 'end'
      open(filename, 'w') do |f|
        f.puts output.join
      end
    end
    
    def usage
      usage_file = File.dirname(__FILE__) + "/../USAGE"
      return File.readlines(usage_file)
    end
  end
end