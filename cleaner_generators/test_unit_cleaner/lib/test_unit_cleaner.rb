module Shubox
  class TestUnitCleaner
    
    attr_reader :class_pattern
    attr_reader :test_pattern
    attr_reader :test_file_path
    attr_reader :ending
    
    attr_reader :koan_pattern
    attr_reader :koan_file_path
    
    def initialize
      @class_pattern = /class [a-zA-Z]\S* < Test::Unit::TestCase/
      @test_pattern = /^\s*def test_/
      @test_file_path = "/test/**/test_*.rb"
      @ending = "end"
      
      # Support for github.com/edgecase/ruby_koans
      @koan_pattern = /class [a-zA-Z]\S* < EdgeCase::Koan/
      @koan_file_path = "/test/**/about_*.rb"      
    end
    
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
        elsif (start_of_test?(line))
          output << line
          output << "  #{@ending}\n"
        end
        
        if (start_of_class?(line))
          outside_class = false
        end
      end
      output << @ending
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
    def start_of_class?(line)
      (@class_pattern =~ line || @koan_pattern =~ line)
    end
    
    def start_of_test?(line)
      @test_pattern =~ line
    end
    
    def clean_directory(dir)
      Dir[dir + @test_file_path].each { |file| clean_file(file) }
      Dir[dir + @koan_file_path].each { |file| clean_file(file) }
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