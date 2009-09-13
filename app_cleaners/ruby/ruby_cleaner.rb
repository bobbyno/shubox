class RubyCleaner
  def self.clean filename
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
end