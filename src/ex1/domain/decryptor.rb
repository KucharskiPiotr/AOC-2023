module Ex1
  class Decryptor
    def initialize(strategy)
      @strategy = strategy
    end

    def parse(line)
      numbers = @strategy.execute(line)
      numbers[0].to_i * 10 + numbers[-1].to_i
    end
  end
end
