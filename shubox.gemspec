# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{shubox}
  s.version = "0.9.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Bobby Norton"]
  s.date = %q{2010-02-17}
  s.default_executable = %q{shubox}
  s.description = %q{shubox lowers the barrier to entry for test-driven learning by providing a basic infrastructure in which
to start coding: A directory structure, some classes and unit tests to get started, and a build script.}
  s.email = ["codeculturist@gmail.com"]
  s.executables = ["shubox"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "PostInstall.txt", "app_generators/ruby/templates/file.txt", "README.rdoc"]
  s.files = ["History.txt", "MIT-LICENSE", "Manifest.txt", "PostInstall.txt", "README.rdoc", "Rakefile", "app_generators/clojure/USAGE", "app_generators/clojure/clojure_generator.rb", "app_generators/clojure/templates/README.rdoc", "app_generators/clojure/templates/bin/repl.sh", "app_generators/clojure/templates/build.xml", "app_generators/clojure/templates/lib/clojure-contrib.jar", "app_generators/clojure/templates/lib/clojure.jar", "app_generators/clojure/templates/lib/jline-0.9.94.jar", "app_generators/clojure/templates/project.iml", "app_generators/clojure/templates/project.ipr", "app_generators/clojure/templates/src/repl.clj", "app_generators/clojure/templates/test/learning/about_clojure_testing.clj", "app_generators/clojure/templates/test/learning/about_forms.clj", "app_generators/clojure/templates/test/learning/about_functional_programming.clj", "app_generators/clojure/templates/test/learning/about_sequences.clj", "app_generators/clojure/templates/test/test_runner.clj", "app_generators/java/USAGE", "app_generators/java/java_generator.rb", "app_generators/java/templates/Greeting.java", "app_generators/java/templates/GreetingTest.java", "app_generators/java/templates/build.xml", "app_generators/java/templates/lib/hamcrest-core.jar", "app_generators/java/templates/lib/junit.jar", "app_generators/java/templates/project.iml", "app_generators/java/templates/project.ipr", "app_generators/ruby/USAGE", "app_generators/ruby/ruby_generator.rb", "app_generators/ruby/templates/file.txt", "app_generators/ruby/templates/rakefile.rb", "app_generators/ruby/templates/right_triangle.rb", "app_generators/ruby/templates/shubox.rb", "app_generators/ruby/templates/test_helper.rb", "app_generators/ruby/templates/test_io.rb", "app_generators/ruby/templates/test_right_triangle.rb", "bin/shubox", "cleaner_generators/test_unit_cleaner/USAGE", "cleaner_generators/test_unit_cleaner/lib/test_unit_cleaner.rb", "cleaner_generators/test_unit_cleaner/templates/clean_test_unit", "cleaner_generators/test_unit_cleaner/templates/filter_test_unit", "cleaner_generators/test_unit_cleaner/test_unit_cleaner_generator.rb", "lib/languages.rb", "lib/shubox.rb", "lib/shubox_app_generator.rb", "script/console", "script/destroy", "script/generate", "test/cleaners/test_test_unit_cleaner.rb", "test/generators/test_clojure_generator.rb", "test/generators/test_java_generator.rb", "test/generators/test_ruby_generator.rb", "test/lib/test_languages.rb", "test/test_generator_helper.rb", "test/test_helper.rb"]
  s.homepage = %q{http://github.com/bobbyno/shubox/tree/master}
  s.post_install_message = %q{PostInstall.txt}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{shubox}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{shubox lowers the barrier to entry for test-driven learning by providing a basic infrastructure in which to start coding: A directory structure, some classes and unit tests to get started, and a build script.}
  s.test_files = ["test/cleaners/test_test_unit_cleaner.rb", "test/generators/test_clojure_generator.rb", "test/generators/test_java_generator.rb", "test/generators/test_ruby_generator.rb", "test/lib/test_languages.rb", "test/test_generator_helper.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<newgem>, ["= 1.5.2"])
      s.add_development_dependency(%q<hoe>, [">= 2.3.3"])
    else
      s.add_dependency(%q<newgem>, ["= 1.5.2"])
      s.add_dependency(%q<hoe>, [">= 2.3.3"])
    end
  else
    s.add_dependency(%q<newgem>, ["= 1.5.2"])
    s.add_dependency(%q<hoe>, [">= 2.3.3"])
  end
end
