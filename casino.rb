load "./player.rb"
# load requires the file each time it is mentioned, rather than only once, like require. This will often fix "unititialized constant" errors
require_relative "Highlow.rb"
load "./coin_flip.rb"
require_relative "slots"
require_relative "rock_paper_scissors.rb"

class Casino < Person
  attr_accessor :name

  def initialize
    #puts instance_methods
    Person.new
    main_menu
  end

  def main_menu
    puts "Type the game number and press ENTER"
    puts "1. High Low"
    puts "2. Coin Flip"
    puts "3. Slots"
    puts "4. Rock, Paper Scissors"
    @game_choice = gets.to_i
    case @game_choice
    when 1
      start_hilo
    when 2
      coin_flip_menu
    when 3
      run_slots
    when 4
      rps_start
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
