#Menu
#Bet
#Win
#Lose
#Play/Play again
  def start_hilo
    puts
    puts
    puts
    puts "Welcome to High-Low #{$name}!"
    puts "You have $#{$balance} in your accout."
    highlow_menu
  end

  def highlow_menu
    puts "HIGHLOW"
    puts "1) Play"
    puts "2) Cashout And Return To The Casino"
    puts "Please pick an option"
    user_input = gets.to_i
    case user_input
      when 1
        highlow_bet
      when 2
        puts "You have $#{$balance}."
        puts "Thanks for playing Highlow #{$name}! Have a good day!"
        main_menu
      else
        puts "Please pick a valid option from the menu."
        highlow_menu
    end
  end

  def highlow_bet
    puts "How much do you want to bet #{$name}?"
    @bet_amt = gets.to_i
    if @bet_amt == 0
      puts "You need to make a bet if you want to play!"
      highlow_bet
    elsif @bet_amt > $balance.to_i
      puts "Sorry you are broke"
      puts 
      exit
    else
      puts "You've placed a bet of $#{@bet_amt}. Are you ready to play? (yes/no)"
      option = gets.strip.downcase.to_s
      if option == 'yes'
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
    puts "Do you want to play again #{$name}? (yes/no)"
    option = gets.strip.downcase.to_s
    if option == 'yes'
      highlow_bet
    else
      puts "Thank you for playing #{$name}! Come back soon!"
      highlow_menu
    end
  end

  def win
    winnings = @bet_amt * 2
    $balance += winnings
    puts "You now have $#{$balance}"
    play_again
  end

  def lose
    $balance -= @bet_amt
    puts "You now have $#{$balance}"
    play_again
  end