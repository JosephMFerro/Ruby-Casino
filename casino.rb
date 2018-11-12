load './player.rb' 
# load requires the file each time it is mentioned, rather than only once, like require. This will often fix "unititialized constant" errors
require_relative './welcome.rb'
require_relative "Highlow.rb"
load './coin_flip.rb'
require_relative "slots"
require_relative "game_4"

def menu_logo
  puts '
.--------.-----.-----.--.--.
|        |  -__|     |  |  |
|__|__|__|_____|__|__|_____|
  '
end

class Casino < Person
  attr_accessor :name
  
  def initialize
    Person.new
    main_menu
  end

  def main_menu
    menu_logo
    puts "----------------------"
    puts "BALANCE: $#{$balance}"
    puts "----------------------"
    puts "Type the game number and press ENTER"
    puts "1. High Low"
    puts "2. Coin Flip"
    puts "3. Slots"
    puts "4. Black Jack"
    @game_choice = gets.to_i
    gamer_choice
  end

  def exit_program
    puts "Thanks for playing! Bye!"
    exit(0)
  end

  def gamer_choice
      case @game_choice
      when 1
        start_hilo
      when 2
        coin_flip_menu
      when 3
        slots_logo
        run_slots
      when 4
        # black jack menu
      else 
        until @game_choice < 5
          puts "Thats not a game!"
          @game_choice = gets.to_i
        end
        gamer_choice
      end
  end
end

Casino.new
