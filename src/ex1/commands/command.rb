require_relative '../domain/decryptor'

module Ex1
  class Command
    attr_accessor :input_lines

    def initialize(input_lines)
      @input_lines = input_lines
      @decryptor = Ex1::Decryptor.new(strategy)
    end

    def handle
      @input_lines
        .map { |line| @decryptor.parse(line) }
        .reduce(:+)
    end

    protected

    def strategy
      raise NotImplementedError
    end
  end
end
