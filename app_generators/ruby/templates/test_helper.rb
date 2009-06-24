require 'stringio'
require 'test/unit'
require File.dirname(__FILE__) + '/../lib/tbox'

module Constants  
  if (!defined? TEST_DATA_DIR)
    TEST_DATA_DIR = File.join(File.expand_path(File.dirname(__FILE__)), "data")
  end
end