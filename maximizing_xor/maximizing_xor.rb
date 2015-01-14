require 'forwardable'
class MaximizingXor
  extend Forwardable

  delegate gets: :input, puts: :output
  attr_reader :input, :output

  def initialize(input = STDIN, output = STDOUT)
    @input = input
    @output = output
  end

  def read
    @low, @high = 2.times.map { gets.to_i }
  end

  def maximized_xor
    (@low...@high).map do |i|
      (i.next..@high).map do |j|
        i ^ j
      end
    end.flatten.max
  end

  def solve
    read
    puts maximized_xor
  end
end

MaximizingXor.new.solve unless ENV['TEST']
