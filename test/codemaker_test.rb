gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/codemaker'

class CodeMakerTest < Minitest::Test

  def test_secret_color_code_exists
    codemaker = Codemaker.new
    assert codemaker.code
  end

  def test_it_makes_color_code
    codemaker = Codemaker.new
    assert_equal 4, codemaker.code.length
  end

  def test_secret_code_is_an_array
    codemaker = Codemaker.new
    assert_equal Array, codemaker.code.class
  end
end
