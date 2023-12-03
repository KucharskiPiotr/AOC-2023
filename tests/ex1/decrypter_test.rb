# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../src/ex1/decryptor'

module Ex1
  class DecrypterTest < Minitest::Test
    def setup
      @decryptor = Ex1::Decryptor.new
    end

    def test_that_decrypter_parses_numbers
      assert_equal(12, @decryptor.parse('1abc2'))
      assert_equal(38, @decryptor.parse('pqr3stu8vwx'))
      assert_equal(15, @decryptor.parse('a1b2c3d4e5f'))
      assert_equal(77, @decryptor.parse('treb7uchet'))
    end
  end
end
