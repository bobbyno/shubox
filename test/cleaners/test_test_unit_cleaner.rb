require File.join(File.dirname(__FILE__), "..", "test_generator_helper.rb")
require File.join(File.dirname(__FILE__), '..', '..', 'cleaner_generators', 'test_unit_cleaner', 'lib', 'test_unit_cleaner')
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
  
  def test_display_usage_with_no_args_or_help
    cleaner = Shubox::TestUnitCleaner.new
    no_args = cleaner.run([""])
    assert_equal(cleaner.usage, no_args)

    help = cleaner.run(["--help"])
    assert_equal(cleaner.usage, help)
  end
  
  def test_detect_comments
    line = "   # Comment here"
    cleaner = Shubox::TestUnitCleaner.new
    assert(cleaner.comment?(line))
    assert(!cleaner.comment?("hello"))
  end
  
  def test_run_cleaner_on_directory
    dir_to_clean = File.expand_path(File.join(File.dirname(__FILE__), '..', 'tmp', 'myproject'))
    clean_file = File.join(dir_to_clean, 'test', 'test_io.rb')
    Shubox::TestUnitCleaner.new.run([dir_to_clean, "ignored extra parameter"])
    assert_equal <<-EOF, File.read(clean_file)
require File.dirname(__FILE__) + '/test_helper'

# Pro tip: Keeping an inline bookmark to the rdocs for the class under study
# makes it easy to continue your learning later.

# Exploring the methods of the IO class: http://www.ruby-doc.org/core/classes/IO.html
class TestIO < Test::Unit::TestCase

  # See String Match for =~ syntax: http://www.ruby-doc.org/core/classes/String.html#M000792
  def test_readlines_reads_files_as_array
  end

end
EOF
  end

  def test_run_cleaner_on_single_file
    file_to_clean = File.expand_path(File.join(File.dirname(__FILE__), '..', 'tmp', 'myproject', 'test', 'samples', 'test_right_triangle.rb'))
    contents = File.read(file_to_clean)

    cleaner = Shubox::TestUnitCleaner.new
    cleaner.run([file_to_clean])
    cleaned_file = File.read(file_to_clean)
    
    assert_equal <<-EOF, cleaned_file
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

    cleaned_contents = cleaner.clean_class(contents)
    assert_equal(cleaned_contents, cleaned_file.strip)
  end
  
  # Including support for cleaning github.com/edgecase/ruby_koans
  def test_clean_koans
    koan = <<-EOF
require File.dirname(__FILE__) + '/edgecase'

class AboutAsserts < EdgeCase::Koan

  # We shall contemplate truth by testing reality, via asserts.
  def test_assert_truth
    assert true
  end
end
EOF

  clean_koan = <<-EOF
require File.dirname(__FILE__) + '/edgecase'

class AboutAsserts < EdgeCase::Koan

  # We shall contemplate truth by testing reality, via asserts.
  def test_assert_truth
  end
end
EOF
  cleaner = Shubox::TestUnitCleaner.new
  assert_equal(clean_koan.strip, cleaner.clean_class(koan))
  end
end