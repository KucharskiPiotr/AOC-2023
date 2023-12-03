# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../src/ex1/word_decryptor'

module Ex1
  class WordDecryptorTest < Minitest::Test
    def setup
      @decryptor = Ex1::WordDecryptor.new
    end

    def test_that_words_get_processed
      assert_equal(29, @decryptor.parse('two1nine'))
      assert_equal(83, @decryptor.parse('eightwothree'))
      assert_equal(13, @decryptor.parse('abcone2threexyz'))
      assert_equal(24, @decryptor.parse('xtwone3four'))
      assert_equal(42, @decryptor.parse('4nineeightseven2'))
      assert_equal(14, @decryptor.parse('zoneight234'))
      assert_equal(76, @decryptor.parse('7pqrstsixteen'))
      assert_equal(48, @decryptor.parse('four7four92lfqkmgponeightbf'))
    end
  end
end
