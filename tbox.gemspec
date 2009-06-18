# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{tbox}
  s.version = "0.5.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Bobby Norton"]
  s.date = %q{2009-06-18}
  s.default_executable = %q{tbox}
  s.description = %q{Provides a basic directory structure for test-driven learning.}
  s.email = ["codeculturist@gmail.com"]
  s.executables = ["tbox"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc", "app_generators/tbox/templates/file.txt"]
  s.files = ["History.txt", "MIT-LICENSE", "Manifest.txt", "PostInstall.txt", "README.rdoc", "Rakefile", "app_generators/tbox/USAGE", "app_generators/tbox/tbox_generator.rb", "app_generators/tbox/templates/README", "app_generators/tbox/templates/file.txt", "app_generators/tbox/templates/rakefile.rb", "app_generators/tbox/templates/right_triangle.rb", "app_generators/tbox/templates/tbox.rb", "app_generators/tbox/templates/test_helper.rb", "app_generators/tbox/templates/test_io.rb", "app_generators/tbox/templates/test_right_triangle.rb", "bin/tbox", "lib/tbox.rb", "script/console", "script/destroy", "script/generate", "tbox.gemspec", "test/test_generator_helper.rb", "test/test_helper.rb", "test/test_tbox_generator.rb"]
  s.homepage = %q{http://github.com/bobbyno/tbox/tree/master}
  s.post_install_message = %q{PostInstall.txt}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{tbox}
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{Test-driven learning is a way to master a programming language by writing unit tests around its API's,  tbox lowers the barrier to entry for test-driven learning by providing a basic infrastructure in which  to start coding: A directory structure, some classes and unit tests to get started, and a Rakefile to run all tests.}
  s.test_files = ["test/test_generator_helper.rb", "test/test_helper.rb", "test/test_tbox_generator.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<newgem>, [">= 1.4.1"])
      s.add_development_dependency(%q<hoe>, [">= 1.8.0"])
    else
      s.add_dependency(%q<newgem>, [">= 1.4.1"])
      s.add_dependency(%q<hoe>, [">= 1.8.0"])
    end
  else
    s.add_dependency(%q<newgem>, [">= 1.4.1"])
    s.add_dependency(%q<hoe>, [">= 1.8.0"])
  end
end
