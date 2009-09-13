require File.join(File.dirname(__FILE__), "test_generator_helper.rb")
require File.join(File.dirname(__FILE__), '..', 'app_cleaners', 'ruby', 'ruby_cleaner.rb')
require 'fileutils'
require 'languages'

class TestRubyCleaner < Test::Unit::TestCase
  include RubiGen::GeneratorTestHelper

  def setup
    bare_setup
    run_generator('ruby', [APP_ROOT], sources)

    # assert_generated_file   "rakefile.rb"
    # assert_directory_exists "lib/samples"
    # assert_generated_file   "lib/samples/right_triangle.rb"
    # assert_generated_file   "lib/shubox.rb"
    # assert_directory_exists "test/samples"
    # assert_generated_file   "test/samples/test_right_triangle.rb"
    # assert_directory_exists "test/data"
    # assert_generated_file   "test/data/file.txt"
    # assert_generated_file   "test/test_io.rb"
    # assert_generated_file   "test/test_helper.rb"
  end

  def teardown
    bare_teardown
  end

  def test_cleaner_without_options
    run_generator('ruby', ['-c', APP_ROOT], sources)
  end

  def test_cleaner_on_simple_file
    file_to_clean = File.expand_path(File.join(File.dirname(__FILE__), 'tmp', 'myproject', 'test', 'test_io.rb'))
    RubyCleaner.clean file_to_clean
    assert_equal <<-EOF, File.read(file_to_clean)
require File.dirname(__FILE__) + '/test_helper'

# Expo usage note: Keeping an inline bookmark to the rdocs for the class under study
# makes it easy to continue your learning later.

# Exploring the methods of the IO class: http://www.ruby-doc.org/core/classes/IO.html
class TestIO < Test::Unit::TestCase
  def test_readlines
  end
end
EOF
  end

  def test_cleaner_on_more_complex_file
    file_to_clean = File.expand_path(File.join(File.dirname(__FILE__), 'tmp', 'myproject', 'test', 'samples', 'test_right_triangle.rb'))
    RubyCleaner.clean file_to_clean
    assert_equal <<-EOF, File.read(file_to_clean)
require File.dirname(__FILE__) + '/../test_helper'
require 'samples/right_triangle'

# An example of testing a class in the lib folder.
class TestRightTriangle < Test::Unit::TestCase
  def test_hypotenuse
  end
  def test_area
  end
end
EOF
  end
end