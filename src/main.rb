require_relative 'ex1/facade'

ex1_input = Infra::InputReader.read('input1.txt')
ex1_facade = Ex1::Facade.new

part_one_command = Ex1::PartOneCommand.new(ex1_input)
puts ex1_facade.handle(part_one_command)

part_two_command = Ex1::PartTwoCommand.new(ex1_input)
puts ex1_facade.handle(part_two_command)
