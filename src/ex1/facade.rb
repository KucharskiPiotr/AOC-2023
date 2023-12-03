require_relative '../infra/input_reader'
require_relative './decryptor'
require_relative './word_decryptor'

module Ex1
  class Facade
    def handle(command)
      command.handle
    end
  end

  class PartOneCommand
    attr_accessor :input_lines

    def initialize(input_lines)
      @input_lines = input_lines
      @decryptor = Ex1::Decryptor.new
    end

    def handle
      @input_lines
        .map { |line| @decryptor.parse(line) }
        .reduce(:+)
    end
  end

  class PartTwoCommand < PartOneCommand
    def initialize(input_lines)
      super(input_lines)
      @decryptor = Ex1::WordDecryptor.new
    end
  end
end