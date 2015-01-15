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

  class AlternatingChars < Template
    def read
      @test_cases = gets.to_i
      @arr = @test_cases.times.map { gets }
    end

    def count_deletions(str)
      deletions = 0
      str.each_char.with_index do |char, index|
        next if index.zero?

        deletions += 1 if char == str[index - 1]
      end

      deletions
    end

    def solve
      @arr.map { |str| count_deletions(str) }
    end
  end
end

Hackerrank.const_get(Hackerrank.constants.last).new.main unless ENV['TEST']
