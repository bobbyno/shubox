module Shubox
  class TestUnitCleaner
    
    def run(args)
      if (%w(-h --help).include?(args.first) || args.empty?)
        puts usage
        return 0
      end

      target = args.first
      # Look for a test class - if there's one, clean lines
      # Use File.file?("/tmp") to see if it's a file
      # Use Dir to find files in the directory - if there are some, it's a dir.
      
      
      if (/.rb$/ =~ target)
        clean_file(target)
      else
        clean_directory(target)
      end
    end
    
    def clean_class(lines)
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
      output.join
    end
    
    private    
    def clean_directory(dir)
      files = Dir["#{dir}/test/**/test_*.rb"].each { |file| clean_file(file) }
    end
    
    def clean_file(filename)
      return if /test_helper.rb/ =~ filename 
      puts "cleaning: #{filename}"
      
      lines = File.readlines(filename)
      output = clean_class(lines)
      
      open(filename, 'w') do |f|
        f.puts output
      end
    end
    
    def usage
      usage_file = File.dirname(__FILE__) + "/../USAGE"
      return File.readlines(usage_file)
    end
  end
end