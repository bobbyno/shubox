require File.join(File.dirname(__FILE__), "test_generator_helper.rb")
require 'languages'

class TestLanguages < Test::Unit::TestCase

  def test_list_current_languages
    langs = Languages.current
    assert(langs.length > 1)
    assert(!langs.include?("."))
    assert(!langs.include?(".."))
  end

  def test_parse_command_for_valid_language
    args = %w{-l=java MyAppName}
    assert_equal("java", Languages.parse(args))
    args = %w{--language=ruby app_name}
    assert_equal("ruby", Languages.parse(args))
  end

  def test_reject_invalid_language
    args = %w{-l=non sense}
    assert_raise RuntimeError do
      Languages.parse(args)
    end
  end

  def test_print_languages
    base = "java|ruby"
    print = Languages.print
    assert(print.include?(base))
  end
end