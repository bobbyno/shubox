require File.join(File.dirname(__FILE__), "..", "test_generator_helper.rb")
require 'fileutils'
require 'languages'

class TestClojureGenerator < Test::Unit::TestCase
  include RubiGen::GeneratorTestHelper

  def setup
    bare_setup
  end

  def teardown
    bare_teardown
  end

  def test_generator_without_options
    run_generator('clojure', [APP_ROOT], sources)

    assert_generated_file   "README.rdoc"
    assert_generated_file   "myproject.ipr"
    assert_generated_file   "myproject.iml"
    assert_generated_file   "build.xml"
    assert_file_contains(PROJECT_NAME, "myproject.ipr")
    
    assert_directory_exists "bin"
    assert_generated_file   "bin/repl.sh"
    
    assert_directory_exists "lib"
    assert_generated_file   "lib/clojure.jar"
    assert_generated_file   "lib/clojure-contrib.jar"
    assert_generated_file   "lib/jline-0.9.94.jar"

    assert_directory_exists "src"
    assert_generated_file   "src/repl.clj"
    
    assert_directory_exists "test"
    assert_directory_exists "test/learning"
    assert_generated_file   "test/learning/about_clojure_testing.clj"
    assert_generated_file   "test/learning/about_functional_programming.clj"
    assert_generated_file   "test/learning/about_forms.clj"
    assert_generated_file   "test/test_runner.clj"

    run_generated_build_script("ant")
  end
end