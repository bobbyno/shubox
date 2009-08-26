require 'stringio'
require 'test/unit'
require File.dirname(__FILE__) + '/../lib/shubox'

module Constants  
  if (!defined? TEST_DATA_DIR)
    TEST_DATA_DIR = File.join(File.expand_path(File.dirname(__FILE__)), "data")
  end
end