class InstallTestUnitCleanerGenerator < RubiGen::Base
  
  def initialize(runtime_args, runtime_options = {})
    super
    @destination_root = File.expand_path(destination_root)
  end
  
  def manifest
    script_options = { :chmod => 0755 }
       
    record do |m|
      m.directory 'script'
      m.template "clean_test_unit", "script/clean_test_unit", script_options
      m.file "test_unit_cleaner.rb", "script/test_unit_cleaner.rb"
    end
  end
end