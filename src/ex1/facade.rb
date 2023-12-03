require_relative '../infra/input_reader'
require_relative './domain/decryptor'
require_relative './strategies/only_numbers'
require_relative './strategies/word_and_numbers'
require_relative './commands/command'

module Ex1
  class Facade
    def handle(command)
      command.handle
    end
  end

  class PartOneCommand < Command
    protected def strategy
      Ex1::OnlyNumbers.new
    end
  end

  class PartTwoCommand < Command
    protected def strategy
      Ex1::WordAndNumbers.new
    end
  end
end