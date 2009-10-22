require 'shubox_app_generator'

class ClojureGenerator < ShuboxAppGenerator

  def manifest
    script_options     = { :chmod => 0755 }
    
    record do |m|
      # Ensure appropriate folder(s) exists
      m.directory ''
      BASEDIRS.each { |path| m.directory path }

      # root
      m.template("project.ipr", "#{@name}.ipr")
      m.file("project.iml", "#{@name}.iml")
      m.template("README.rdoc", "README.rdoc")

      # bin
      m.directory "bin"
      m.file_copy_each %w(repl.sh runtests.sh), "bin", script_options

      # lib
      m.directory "lib"
      m.file_copy_each  %w(clojure-contrib.jar clojure.jar jline-0.9.94.jar), "lib"

      # src
      m.directory "src"
      m.file("src/repl.clj", "src/repl.clj")

      # test
      m.directory "test/core"
      m.file("test/core/about_clojure_testing.clj", "test/core/about_clojure_testing.clj")
      m.file("test/core/about_forms.clj", "test/core/about_forms.clj")
      m.file("test/tests.clj", "test/tests.clj")
    end
  end

  protected
    # Installation skeleton.
    BASEDIRS = %w(
      build
      lib
      src
      test
    )
end