require 'tbox_app_generator'

class JavaGenerator < TboxAppGenerator

  def manifest
    record do |m|
      # Ensure appropriate folder(s) exists
      m.directory ''
      BASEDIRS.each { |path| m.directory path }

      # root
      m.template("project.ipr", "#{@name}.ipr")
      m.file("project.iml", "#{@name}.iml")
      
      # build
      m.template("build.xml", "build/build.xml")

      # lib
      m.file_copy_each %w(hamcrest-core.jar junit.jar), "lib"
      
      # src
      m.directory "src/com/samples"
      m.file("Greeting.java", "src/com/samples/Greeting.java")
      
      # test
      m.directory "test/com/samples"
      m.file("GreetingTest.java", "test/com/samples/GreetingTest.java")
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