# frozen_string_literal: true

require 'json'
require_relative 'hangman_logic'
require_relative 'hangman_board'

# Ok
class Hangman
  def initialize
    @word = choose_word
    system('clear')
    @words_dictionary = File.read('./words_dictionary.json')
    @hangman_logic = HangmanLogic.new(@word)
    @hangman_board = HangmanBoard.new(@hangman_logic)
  end

  def choose_word
    print ("Welcome to Hangman!\nWould you like a custom or random word?\nPlease type 'custom' or 'random': ")
    loop do
      response = gets.chomp
      if response.upcase == 'CUSTOM'
        print 'Choose your word: '
        word = gets.chomp.upcase
        return word
      elsif response.upcase == 'RANDOM'
        file = File.read('./words_dictionary.json')
        data = JSON.parse(file)
        word = data.keys.sample.upcase
        return word
      else
        print "Please type 'custom' or 'random': "
      end
    end
  end

  def play
    until @hangman_logic.finished?
      @hangman_board.display_game_board
      @hangman_logic.guess
      system('clear')
    end

    puts "The word was #{@hangman_logic.word}."
  end
end

hang = Hangman.new
hang.play

