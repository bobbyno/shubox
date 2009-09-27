module Shubox
  class TestUnitCleaner
    
    def run(args)
      target = args.first
      return usage if empty_or_help?(target)
      
      if File.file?(target)
        clean_file(target)
      else
        clean_directory(target)
      end
    end
    
    def clean_class(lines)
      output = []
      outside_class = true
      
      lines.each do |line|
        if (outside_class || comment?(line))
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
    
    def comment?(line)
      (line =~ /^\s*#/ || line =~ /^\s*$/)
    end
    
    def empty_or_help?(input)
      return (input.nil? || input.empty? || %w(-h --help).include?(input))
    end
    
    def usage
      usage_file = File.dirname(__FILE__) + "/../USAGE"
      return File.readlines(usage_file)
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
  end
end