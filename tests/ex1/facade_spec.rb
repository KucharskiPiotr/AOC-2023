# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/mock'
require_relative '../../src/ex1/facade'
require_relative '../../src/infra/input_reader'

describe 'Ex1::Facade' do
  before do
    @facade = Ex1::Facade.new
    @part_one_command = Ex1::PartOneCommand.new(%w[1abc2 pqr3stu8vwx a1b2c3d4e5f treb7uchet])
    @part_two_command = Ex1::PartTwoCommand.new(%w[two1nine eightwothree abcone2threexyz xtwone3four 4nineeightseven2 zoneight234 7pqrstsixteen])
  end

  describe 'when part one command is provided' do
    it 'calculates sum' do
      result = @facade.handle(@part_one_command)
      _(result).must_equal(142)
    end
  end

  describe 'when part two command is provided' do
    it 'calculates sum' do
      result = @facade.handle(@part_two_command)
      _(result).must_equal(281)
    end
  end
end
