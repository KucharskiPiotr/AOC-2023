require_relative 'ex1/facade'

part_one_command = Ex1::PartOneCommand.new(Infra::InputReader.read('input1.txt'))
result = Ex1::Facade.new.handle(part_one_command)
puts result