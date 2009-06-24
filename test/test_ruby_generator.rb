require File.join(File.dirname(__FILE__), "test_generator_helper.rb")
require 'fileutils'

class TestRubyGenerator < Test::Unit::TestCase
  include RubiGen::GeneratorTestHelper

  def setup
    bare_setup
  end

  def teardown
    bare_teardown
  end

  def test_generator_without_options
    run_generator('ruby', [APP_ROOT], sources)
    
    assert_generated_file   "rakefile.rb"
    assert_directory_exists "lib/samples"
    assert_generated_file   "lib/samples/right_triangle.rb"
    assert_generated_file   "lib/tbox.rb"
    assert_directory_exists "test/samples"
    assert_generated_file   "test/samples/test_right_triangle.rb"
    assert_directory_exists "test/data"
    assert_generated_file   "test/data/file.txt"
    assert_generated_file   "test/test_io.rb"
    assert_generated_file   "test/test_helper.rb"
    
    run_generated_build_script("rake")
  end
  
end