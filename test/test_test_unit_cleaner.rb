require File.join(File.dirname(__FILE__), "test_generator_helper.rb")
require File.join(File.dirname(__FILE__), '..', 'cleaner_generators', 'install_test_unit_cleaner', 'templates', 'test_unit_cleaner')
require 'fileutils'
require 'languages'

class TestTestUnitCleaner < Test::Unit::TestCase
  include RubiGen::GeneratorTestHelper

  def setup
    bare_setup
    run_generator('ruby', [APP_ROOT], sources)
  end

  def teardown
    bare_teardown
  end

  def test_cleaner_without_options
    run_generator('install_test_unit', [APP_ROOT], sources)
  end

  def test_cleaner_on_simple_file
    file_to_clean = File.expand_path(File.join(File.dirname(__FILE__), 'tmp', 'myproject', 'test', 'test_io.rb'))
    Shubox::TestUnitCleaner.new.clean file_to_clean
    assert_equal <<-EOF, File.read(file_to_clean)
require File.dirname(__FILE__) + '/test_helper'

# Pro tip: Keeping an inline bookmark to the rdocs for the class under study
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
    Shubox::TestUnitCleaner.new.clean file_to_clean
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
  
private
  def sources
    [ RubiGen::PathSource.new(:test, File.join(File.dirname(__FILE__),"..", "app_generators")),
      RubiGen::PathSource.new(:test, File.join(File.dirname(__FILE__), "..", "cleaner_generators"))
    ]
  end
end