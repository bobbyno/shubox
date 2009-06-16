class TboxGenerator < RubiGen::Base

  DEFAULT_SHEBANG = File.join(Config::CONFIG['bindir'],
                              Config::CONFIG['ruby_install_name'])

  default_options :author => nil

  attr_reader :name

  def initialize(runtime_args, runtime_options = {})
    super
    usage if args.empty?
    @destination_root = File.expand_path(args.shift)
    @name = base_name
    extract_options
  end

  def manifest
    record do |m|
      # Ensure appropriate folder(s) exists
      m.directory ''
      BASEDIRS.each { |path| m.directory path }

      m.file "rakefile.rb", "rakefile.rb"
      m.file "README", "README"
      m.file "../../../MIT-LICENSE", "MIT-LICENSE"
      # Create stubs
      # m.template "template.rb",  "some_file_after_erb.rb"
      # m.template_copy_each ["template.rb", "template2.rb"]
      # m.file     "file",         "some_file_copied"
      # m.file_copy_each ["path/to/file", "path/to/file2"]
      m.directory "lib/samples"
      m.file "right_triangle.rb", "lib/samples/right_triangle.rb"
      m.file "tbox.rb", "lib/tbox.rb"
      m.directory "test/samples"
      m.directory "test/data"
      m.file "test_right_triangle.rb", "test/samples/test_right_triangle.rb"
      m.file "test_io.rb", "test/test_io.rb"
      m.file "file.txt", "test/data/file.txt"
      m.file "test_helper.rb", "test/test_helper.rb"

      m.dependency "install_rubigen_scripts", [destination_root, 'tbox'],
        :shebang => options[:shebang], :collision => :force
    end
  end

  protected
    def banner
      <<-EOS
Creates a test-driven learning environment: A directory structure, some sample classes and unit tests, 
and a Rakefile to run all tests.

USAGE: #{spec.name} dir_name
EOS
    end

    def add_options!(opts)
      opts.separator ''
      opts.separator 'Options:'
      # For each option below, place the default
      # at the top of the file next to "default_options"
      # opts.on("-a", "--author=\"Your Name\"", String,
      #         "Some comment about this option",
      #         "Default: none") { |o| options[:author] = o }
      opts.on("-v", "--version", "Show the #{File.basename($0)} version number and quit.")
    end

    def extract_options
      # for each option, extract it into a local variable (and create an "attr_reader :author" at the top)
      # Templates can access these value via the attr_reader-generated methods, but not the
      # raw instance variable value.
      # @author = options[:author]
    end

    # Installation skeleton.  Intermediate directories are automatically
    # created so don't sweat their absence here.
    BASEDIRS = %w(
      lib
      log
      script
      test
      tmp
    )
end