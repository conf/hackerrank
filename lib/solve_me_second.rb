require 'forwardable'
module Hackerrank
  class SolveMeSecond
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
      @arr = @test_cases.times.map { gets.split(' ').map(&:to_i) }
    end

    def solve
      @arr.map { |numbers| numbers.reduce(&:+) }
    end
  end
end

Hackerrank.const_get(Hackerrank.constants.last).new.main unless ENV['TEST']
