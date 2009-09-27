require File.dirname(__FILE__) + '/test_helper'

# Pro tip: Keeping an inline bookmark to the rdocs for the class under study
# makes it easy to continue your learning later.

# Exploring the methods of the IO class: http://www.ruby-doc.org/core/classes/IO.html
class TestIO < Test::Unit::TestCase

  # See String Match for =~ syntax: http://www.ruby-doc.org/core/classes/String.html#M000792
  def test_readlines_reads_files_as_array
    contents = IO.readlines(File.join(Constants::TEST_DATA_DIR, "file.txt"))
    assert(contents[0] =~ /Salam/)
  end

end