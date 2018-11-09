require_relative './player'
require_relative 'game_1'
require_relative 'coin_flip'
require_relative 'game_3'
require_relative 'game_4'

class Casino
  attr_accessor :name, :balance

  def initialize(name, balance)
    @name = name
    $balance = balance
    main_menu
  end

  def main_menu
    puts "Hello, #{@name}, what are we playing today?"
    puts "Type the game number and press ENTER"
    puts "1. High Low"
    puts "2. Coin Flip"
    puts "3. Slots"
    puts "4. Black Jack"
    @game_choice = gets.to_i
      case @game_choice
      when 1
        # highlow menu
      when 2
        puts "f"
      when 3
        # slots menu
      when 4
        # black jack menu
      else 
        "Thats not a game!"
      end
  end
end
Casino.new