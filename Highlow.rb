#Menu
#Bet
#Win
#Lose
#Play/Play again
  def start_hilo
    puts
    puts
    puts
    puts "Welcome to High-Low #{@name}!"
    puts "You have $#{@balance} in your accout."
    highlow_menu
  end

  def highlow_menu
    puts "HIGHLOW"
    puts "1) Play"
    puts "2) Cashout And Return To The Casino"
    puts "Please pick an option"

    case @casino.user_input
      when '1'
        highlow_bet
      when '2'
        puts "You have $#{@balance}."
        puts "Thanks for playing Highlow #{@name}! Have a good day!"
        @main_menu
      else
        puts "Please pick a valid option from the menu."
        highlow_menu
    end
  end

  def highlow_bet
    puts "How much do you want to bet #{@name}?"
    @player_bet = @casino.user_input.to_i
    if @player_bet == 0
      puts "You have to make a bet if you want to play!"
      highlow_bet
    elsif @player_bet > player.bank_roll
      puts "Sorry you are broke"
      puts 
      exit
    else
      puts "You've placed a bet of $#{@player_bet}. Are you ready to play? (yes/no)"
      if @casino.user_input == 'yes'
        play_game
      else
        puts "Come back when you're ready to play!"
        highlow_menu
      end
    end
  end

  def play_game
    @dealer_card = rand(1..14)
    @player_card = rand(1..14)
    puts "Dealer flips a #{@dealer_card}."
    puts "Your card is a #{@player_card}."
    if @dealer_card > @player_card
      puts "Sorry, the Dealer wins!"
      lose
    elsif @dealer_card == @player_card
      puts "PUSH!"
      play_again
    else
      puts "Congrats! You Win!"
      win
    end
  end

  def play_again
    puts "Do you want to play again #{@name}? (yes/no)"
    if @casino.user_input == 'yes'
      highlow_bet
    else
      puts "Thank you for playing #{@name}! Come back soon!"
      @main_menu.menu
    end
  end

  def win
    player.bank_roll = player.bank_roll + (@player_bet * 2)
    puts "You now have $#{@balance}"
    play_again
  end

  def lose
    player.bank_roll = player.bank_roll - @player_bet
    puts "You now have $#{@balance}"
    play_again
  end
end
