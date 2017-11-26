class Codebreaker

  class Game
    attr_reader :output

    def initialize(output)
      @output = output
    end

    def start(secret_number)
      @secret_number = secret_number
      @secret_array = secret_number.split('')

      output.puts "Welcome to Codebreaker"
      output.puts "Enter guess:"

    end

    def guess(input)
      unless input.length == @secret_number.length
        output.puts "Try guessing a number with four digits"
      else
        count_matches(input)
        display_guesses
      end
    end

    def count_matches(input)
      @input_array = input.split('')
      @exact_match = 0
      @number_match = 0

      @secret_array.each_with_index do |s_number, index|
		      if @input_array[index] == s_number
			         @exact_match += 1
		      elsif s_number == input[s_number]
			         @number_match += 1
		      end
	    end
    end

    def display_guesses
      output.puts (@number_match + @exact_match == 0) ? "" : "+" * @exact_match + "-" * @number_match
    end

  end
end
