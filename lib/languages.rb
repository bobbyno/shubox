class Languages

  def self.parse(args)
    lang = args.find {|arg| ((arg =~ /-l=/) or (arg =~ /--language=/)) }
    lang = "-l=ruby" if lang.nil?
    lang = lang.split('=')[1]
    raise "Supported languages: #{current.inspect}" if (!current.member?(lang))
    lang
  end
  
  def self.current
    langs = Dir.entries(File.join(File.dirname(__FILE__), "../app_generators"))
    langs.reject {|i| ((i == ".") or (i == ".."))}
  end
  
  def self.print
    list = ""
    current.each {|lang| list << lang << '|'}
    list.chomp('|')
  end
  
end