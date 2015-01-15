require 'forwardable'
module Hackerrank
  class Template
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
    end

    def solve
    end
  end

  class MaximizingXor < Template
    def read
      @low, @high = 2.times.map { gets.to_i }
    end

    # @low ^ @high finds most significant bit, that is different between @low and @high
    # For example, for @low = 15 and @high = 15 it would be:  1010 ^ 1111 = 0101 (5 in decimal)
    # we're interested in this bit ------------------------------------------^
    # after that turn all lower bits into 1, so the answer is 0111.
    # It can be easily done by finding next value of (power of 2) - 1
    # that is bigger than our most significant bit.
    def solve
      most_significant_bit = @low ^ @high
      (1..10).map { |i| 2 ** i }.detect { |i| i > most_significant_bit }.pred
    end
  end
end

Hackerrank.const_get(Hackerrank.constants.last).new.main unless ENV['TEST']
