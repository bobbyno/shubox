module Shubox
  class TestUnitCleaner
    
    def run(args)
      if (%w(-h --help).include?(args.first) || args.empty?)
        puts usage
        return 0
      end

      target = args.first
      
      if (/.rb$/ =~ target)
        clean(target)
      else
        clean_directory(target)
      end
    end
    
    private    
    def clean_directory(dir)
      files = Dir["#{dir}/test/**/test_*.rb"].each { |file| clean(file) }
    end
    
    def clean(filename)
      return if /test_helper.rb/ =~ filename 
      puts "cleaning: #{filename}"
      
      lines = File.readlines(filename)
      output = []
      outside_class = true
      
      lines.each do |line|
        if (outside_class)
          output << line
        elsif (/^\s*def test_/ =~ line)
          output << line
          output << "  end\n"
        end
        
        if (/class [a-zA-Z]\S* < Test::Unit::TestCase/ =~ line)
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