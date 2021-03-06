class TestUnitCleanerGenerator < RubiGen::Base
  
  def initialize(runtime_args, runtime_options = {})
    super
    @destination_root = File.expand_path(destination_root)
  end
  
  def manifest
    script_options = { :chmod => 0755 }
       
    record do |m|
      m.directory 'script'
      m.file "clean_test_unit", "script/clean_test_unit", script_options
      m.file "filter_test_unit", "script/filter_test_unit", script_options
    end
  end
  
protected
  def banner
        <<-EOS
Install a cleaner for Test::Unit tests. 

Deletes all method bodies in the tests.

EOS
  end
end