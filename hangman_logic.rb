# frozen_string_literal: true

# ok
class HangmanLogic
  WRONG_ANSWERS_ALLOWED = 6

  attr_accessor :word, :guessed, :incorrect_guesses, :blank

  def initialize(word)
    @word = word
    @guessed = {}
    @incorrect_guesses = 0
    @blank = '_' * @word.length
  end

  def guess_check
    loop do
      print 'Guess your next letter: '
      input = gets.chomp

      if input.length > 1 || !input.match?(/[[:alpha:]]/)
        puts 'Invalid input. Please guess a letter.'

      elsif @guessed.key?(input.upcase)
        puts 'Letter already guessed. Please guess another.'

      else
        @guessed[input.upcase] = 0
        return input.upcase
      end
    end
  end

  def fill_in
    input = guess_check
    i = 0
    while i < @word.length
      if @word[i] == input
        @blank[i] = input
      end
      i += 1
    end
  end

  def guess
    original = Marshal.load(Marshal.dump(@blank))
    fill_in
    if @blank == original
      @incorrect_guesses += 1
    end
  end

  def finished?
    if @blank == @word
      puts 'You WIN!!'

    elsif WRONG_ANSWERS_ALLOWED - @incorrect_guesses < 1
      puts 'You LOSE :('

    else
      return false
    end
    return true
  end

  def letters_guessed
    @guessed.keys
  end

  def guesses_left
    WRONG_ANSWERS_ALLOWED - @incorrect_guesses
  end

end


