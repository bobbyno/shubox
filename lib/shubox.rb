$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

$:.unshift(File.dirname(__FILE__) + '/../cleaner_generators') unless
  $:.include?(File.dirname(__FILE__) + '/../cleaner_generators') || $:.include?(File.expand_path(File.dirname(__FILE__) + '../cleaner_generators'))

module Shubox
  VERSION = '0.9.1'
end

require 'test_unit_cleaner/lib/test_unit_cleaner'