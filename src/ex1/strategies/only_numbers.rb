module Ex1
  class OnlyNumbers
    def execute(line)
      line.gsub(/[a-zA-Z]/, '')
    end
  end
end