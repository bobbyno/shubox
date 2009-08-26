require 'shubox_app_generator'

class RubyGenerator < ShuboxAppGenerator

  def manifest
    record do |m|
      # Ensure appropriate folder(s) exists
      m.directory ''
      BASEDIRS.each { |path| m.directory path }

      m.file "rakefile.rb", "rakefile.rb"
      m.directory "lib/samples"
      m.file "right_triangle.rb", "lib/samples/right_triangle.rb"
      m.file "shubox.rb", "lib/shubox.rb"
      m.directory "test/samples"
      m.directory "test/data"
      m.file "test_right_triangle.rb", "test/samples/test_right_triangle.rb"
      m.file "test_io.rb", "test/test_io.rb"
      m.file "file.txt", "test/data/file.txt"
      m.file "test_helper.rb", "test/test_helper.rb"

      m.dependency "install_rubigen_scripts", [destination_root, 'shubox'],
        :shebang => options[:shebang], :collision => :force
    end
  end

  protected
    # Installation skeleton.
    BASEDIRS = %w(
      lib
      script
      test
    )
end