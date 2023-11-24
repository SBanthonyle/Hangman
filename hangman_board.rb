# frozen_string_literal: true

require_relative 'hangman_logic'

# ok
class HangmanBoard
  def initialize(hangman_logic)
    @hangman_logic = hangman_logic
  end

  def display_game_board
    puts "Guesses Left: #{6 - @hangman_logic.incorrect_guesses}"
    puts "Guessed letters: #{@hangman_logic.letters_guessed.join(', ')}" # make more tightly encapsulated
    puts "Word: #{@hangman_logic.blank}"
  end
end
