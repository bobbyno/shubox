# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{shubox}
  s.version = "0.8.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Bobby Norton"]
  s.date = %q{2009-09-26}
  s.default_executable = %q{shubox}
  s.description = %q{Test-driven learning is a way to master a programming language by writing unit tests around its API's.
shubox lowers the barrier to entry for test-driven learning by providing a basic infrastructure in which
to start coding: A directory structure, some classes and unit tests to get started, and a build script.

shubox currently creates environments for Ruby and Java, but can easily be extended to any language that
lends itself to unit testing. shubox is built on newgem, so extending the framework is as simple as creating
new generator scripts.

After installing shubox and generating a testing environment, you'll start off with some passing tests that exercise
parts of the language's API. Write new learning tests, naming each method with the intent of the lesson, then write 
the code that makes a test pass. 

Can you complete the lesson again from memory? If not, you may need to study the concept more closely 
and implement the tests again. According to {a paper by Karpicke and Roediger}[http://psych.wustl.edu/memory/Roddy%20article%20PDF's/Karpicke_Roediger_2008_Science.pdf],
"repeated retrieval practice led to greater than 150% improvements in long-term retention than studying alone.
...Although educators and psychologists often consider testing a neutral process that merely assesses the 
contents of memory, practicing retrieval during tests clearly produces more learning than additional 
encoding or study once an item has been recalled."

shubox makes repeated testing easy by providing built-in test cleaners that delete your test implementations, 
while keeping comments and test names to express the intent of the test.}
  s.email = ["codeculturist@gmail.com"]
  s.executables = ["shubox"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "PostInstall.txt", "app_generators/ruby/templates/file.txt", "README.rdoc"]
  s.files = ["History.txt", "MIT-LICENSE", "Manifest.txt", "PostInstall.txt", "README.rdoc", "Rakefile", "app_generators/java/USAGE", "app_generators/java/java_generator.rb", "app_generators/java/templates/Greeting.java", "app_generators/java/templates/GreetingTest.java", "app_generators/java/templates/build.xml", "app_generators/java/templates/lib/hamcrest-core.jar", "app_generators/java/templates/lib/junit.jar", "app_generators/java/templates/project.iml", "app_generators/java/templates/project.ipr", "app_generators/ruby/USAGE", "app_generators/ruby/ruby_generator.rb", "app_generators/ruby/templates/file.txt", "app_generators/ruby/templates/rakefile.rb", "app_generators/ruby/templates/right_triangle.rb", "app_generators/ruby/templates/shubox.rb", "app_generators/ruby/templates/test_helper.rb", "app_generators/ruby/templates/test_io.rb", "app_generators/ruby/templates/test_right_triangle.rb", "bin/shubox", "cleaner_generators/test_unit_cleaner/USAGE", "cleaner_generators/test_unit_cleaner/lib/test_unit_cleaner.rb", "cleaner_generators/test_unit_cleaner/templates/clean_test_unit", "cleaner_generators/test_unit_cleaner/templates/filter_test_unit", "cleaner_generators/test_unit_cleaner/test_unit_cleaner_generator.rb", "lib/languages.rb", "lib/shubox.rb", "lib/shubox_app_generator.rb", "script/console", "script/destroy", "script/generate", "test/cleaners/test_test_unit_cleaner.rb", "test/generators/test_java_generator.rb", "test/generators/test_ruby_generator.rb", "test/lib/test_languages.rb", "test/test_generator_helper.rb", "test/test_helper.rb"]
  s.homepage = %q{http://github.com/bobbyno/shubox/tree/master}
  s.post_install_message = %q{PostInstall.txt}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{shubox}
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{Test-driven learning is a way to master a programming language by writing unit tests around its API's}
  s.test_files = ["test/cleaners/test_test_unit_cleaner.rb", "test/generators/test_java_generator.rb", "test/generators/test_ruby_generator.rb", "test/lib/test_languages.rb", "test/test_generator_helper.rb", "test/test_helper.rb"]

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
