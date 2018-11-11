require_relative 'player'
require_relative 'casino'

$coin_arr = [
  "heads",
  "tails"
]

def coin_flip_logo
  puts "
   _______ _______ ___ ______         _______ ___     ___ _______ 
  |   _   |   _   |   |   _  | ______|   _   |   |   |   |   _   |
  |.  1___|.  |   |.  |.  |   |______|.  1___|.  |   |.  |.  1   |
  |.  |___|.  |   |.  |.  |   |      |.  __) |.  |___|.  |.  ____|
  |:  1   |:  1   |:  |:  |   |      |:  |   |:  1   |:  |:  |    
  |::.. . |::.. . |::.|::.|   |      |::.|   |::.. . |::.|::.|    
  `-------`-------`---`--- ---'      `---'   `-------`---`---'    
  "
end

def coin_flip_menu
  coin_flip_logo
  puts "---Welcome To Coin Flip---"
  puts "Rules: "
  puts "1. Type 'start' to begin or 'quit' to cancel"
  puts "2. Enter your bet amount"
  puts "2. Type 'heads' to guess heads or 'tails' to guess tails"
  puts "---Good Luck---"
  $player_choice = gets.strip.to_s

  if $player_choice == 'start'
    start_game
  elsif $player_choice == 'quit'
    puts "Good Bye"
  else 
    puts "Whats that supposed to mean?"
  end
end

def start_game

  until $player_choice == 'quit'
  puts "BALANCE: $#{$balance}"
  puts "How much would you like to bet?"
  @bet_amt = gets.to_i

  if @bet_amt > $balance
    until @bet_amt <= $balance
    puts "You don't have enough to bet that much! Try something lower."
    @bet_amt = gets.to_i
    end
  end

  puts "Guess 'heads' or 'tails'"
  @user_choice = gets.strip.to_s
  @system_choice = $coin_arr.sample

  if @user_choice == @system_choice
    puts "Lucky Duck! You won $#{@bet_amt}"
    $balance += @bet_amt * 2
  else
    puts "Loser! The Correct answer was #{@system_choice}. You lost $#{@bet_amt}!"
    $balance -= @bet_amt * 2
    if $balance < 0
      puts "--NEGATIVE BALANCE--"
      puts "You owe us #{$balance * -1} bucks!"
      exit(0)
    end
  end
    puts "BALANCE: $#{$balance}"
    puts "Play again? (start/quit)"
    $player_choice = gets.strip.to_s
end
end