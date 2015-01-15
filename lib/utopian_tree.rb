require 'forwardable'
class UtopianTree
  extend Forwardable

  delegate gets: :input, puts: :output
  attr_reader :input, :output

  def initialize(input = STDIN, output = STDOUT)
    @input = input
    @output = output
  end

  def main
    read
    puts solve
  end

  def read
    @test_cases = gets.to_i
    @arr = @test_cases.times.map { gets.to_i }
  end

  def height(cycles)
    (1..cycles).inject(1) { |total, cycle| cycle.odd? ? total * 2 : total + 1 }
  end

  def solve
    @arr.map { |cycles| height(cycles) }
  end
end

UtopianTree.new.main unless ENV['TEST']
