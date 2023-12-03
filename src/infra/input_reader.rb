module Infra
  class InputReader
    def self.read(filename)
      File.read("inputs/#{filename}").split
    end
  end
end