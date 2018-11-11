require_relative './player.rb'
require_relative 'game_1'
require_relative 'coin_flip'
require_relative 'slots'
require_relative 'game_4'

class Casino
  attr_accessor :name, :balance

  def initialize
    main_menu
  end

  def main_menu
    puts "Hello, #{@name}, what are we playing today?"
    puts "Type the game number and press ENTER"
    puts "1. High Low"
    puts "2. Coin Flip"
    puts "3. Slots"
    puts "4. Black Jack"
    puts "5. Quit"
    @game_choice = gets.to_i
      case @game_choice
      when 1
        # highlow menu
      when 2
        coin_flip_menu
      when 3
        run_slots
      when 4
        # black jack menu
      when 5
        exit_program
      else 
        "Thats not a game!"
      end
  end
  def exit_program
    puts "Thanks for playing! Bye!"
    exit(0)
  end
end
Casino.new