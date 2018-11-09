require_relative 'player'
require_relative 'coin_flip'

$coin_arr = [
  "heads",
  "tails"
]

def coin_flip_menu
  puts "---Welcome To Coin Flip---"
  puts "Rules: "
  puts "1. Type 'start' to begin or 'quit' to cancel"
  puts "2. Enter your bet amount"
  puts "2. Type 'heads' to guess heads or 'tails' to guess tails"
  puts "---Good Luck---"
  @player_choice = gets.strip.to_s
  if @player_choice == 'start'
    start_game
  elsif @player_choice == 'quit'
    puts "Good Bye"
  else 
    puts "Whats that supposed to mean?"
  end
end

def start_game
  while @player_choice == 'start'
  puts "BALANCE: $#{$balance}"
  puts "How much would you like to bet?"
  @bet_amt = gets.to_i
  puts "Guess 'heads' or 'tails'"
  @user_choice = gets.strip.to_s
  @system_choice = $coin_arr.sample
  if @user_choice == @system_choice
    puts "Lucky Duck! You won $#{@bet_amt}"
    @balance += @bet_amt * 2
  else
    puts "Loser! The Correct answer was #{@system_choice}. You lost $#{@bet_amt}!"
  end
    puts "BALANCE: $#{@balance}"
    puts "Play again? (start/quit)"
    @player_choice = gets.to_s
end
end