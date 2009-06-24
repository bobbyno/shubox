require File.join(File.dirname(__FILE__), "test_generator_helper.rb")

class TestJavaGenerator < Test::Unit::TestCase
  include RubiGen::GeneratorTestHelper

  def setup
    bare_setup
  end

  def teardown
    bare_teardown
  end

  def test_generator_without_options
    run_generator('java', [APP_ROOT], sources)
    assert_generated_file   "myproject.ipr"
    assert_generated_file   "myproject.iml"
    assert_file_contains(PROJECT_NAME, "myproject.ipr")

    assert_directory_exists "build"
    assert_generated_file   "build/build.xml"
    assert_file_contains(PROJECT_NAME, "build/build.xml")
    
    assert_directory_exists "lib"
    assert_generated_file   "lib/junit.jar"
    assert_generated_file   "lib/hamcrest-core.jar"    
    
    assert_directory_exists "src"
    assert_generated_file   "src/com/samples/Greeting.java"
    
    assert_directory_exists "test"    
    assert_generated_file   "test/com/samples/GreetingTest.java"
    
    run_generated_build_script("ant -f build/build.xml")
  end

end