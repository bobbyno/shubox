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
      m.file "bin/repl.sh", "bin/repl.sh", script_options

      # lib
      m.directory "lib"
      m.file_copy_each  %w(clojure-contrib.jar clojure.jar jline-0.9.94.jar), "lib"

      # src
      m.directory "src"
      m.file("src/repl.clj", "src/repl.clj")

      # test
      m.directory "test/learning"
      m.file("test/learning/about_clojure_testing.clj", "test/learning/about_clojure_testing.clj")
      m.file("test/learning/about_forms.clj", "test/learning/about_forms.clj")
      m.file("test/learning/about_sequences.clj", "test/learning/about_sequences.clj")
      m.file("test/learning/about_functional_programming.clj", "test/learning/about_functional_programming.clj")
      m.file("test/test_runner.clj", "test/test_runner.clj")
      m.file("build.xml", "build.xml")
    end
  end

  protected
    # Installation skeleton.
    BASEDIRS = %w(bin lib src test)
end