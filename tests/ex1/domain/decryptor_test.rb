# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../../src/ex1/domain/decryptor'
require_relative '../../../src/ex1/strategies/word_and_numbers'
require_relative '../../../src/ex1/strategies/only_numbers'

module Ex1
  class DecryptorTest < Minitest::Test
    def setup
      @part_one = Decryptor.new(OnlyNumbers.new)
      @part_two = Decryptor.new(WordAndNumbers.new)
    end

    def test_that_decrypter_parses_numbers
      assert_equal(12, @part_one.parse('1abc2'))
      assert_equal(38, @part_one.parse('pqr3stu8vwx'))
      assert_equal(15, @part_one.parse('a1b2c3d4e5f'))
      assert_equal(77, @part_one.parse('treb7uchet'))
    end

    def test_that_words_get_processed
      assert_equal(29, @part_two.parse('two1nine'))
      assert_equal(83, @part_two.parse('eightwothree'))
      assert_equal(13, @part_two.parse('abcone2threexyz'))
      assert_equal(24, @part_two.parse('xtwone3four'))
      assert_equal(42, @part_two.parse('4nineeightseven2'))
      assert_equal(14, @part_two.parse('zoneight234'))
      assert_equal(76, @part_two.parse('7pqrstsixteen'))
      assert_equal(48, @part_two.parse('four7four92lfqkmgponeightbf'))
    end
  end
end
