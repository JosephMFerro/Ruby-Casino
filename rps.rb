require "pry"
require "colorize"
load "./player.rb"

def rps_logo
  puts
  " *******                    **     *******                                    ********         **                                        
  /**////**                  /**    /**////**           ******                 **//////         //                                         
  /**   /**   ******   ***** /**  **/**   /**  ******  /**///**  *****  ******/**         *****  **  ******  ******  ******  ******  ******
  /*******   **////** **///**/** ** /*******  //////** /**  /** **///**//**//*/********* **///**/** **////  **////  **////**//**//* **//// 
  /**///**  /**   /**/**  // /****  /**////    ******* /****** /******* /** / ////////**/**  // /**//***** //***** /**   /** /** / //***** 
  /**  //** /**   /**/**   **/**/** /**       **////** /**///  /**////  /**          /**/**   **/** /////** /////**/**   /** /**    /////**
  /**   //**//****** //***** /**//**/**      //********/**     //******/***    ******** //***** /** ******  ****** //****** /***    ****** 
  //     //  //////   /////  //  // //        //////// //       ////// ///    ////////   /////  // //////  //////   //////  ///    //////  
  "
end

def rps_start
  if $balance > 0
    rps_logo
    # {@name} is not functioning
    puts "Welcome to Rock, Paper, Scissors, #{@name}!".yellow
    puts "You have $#{$balance} in your accout.".yellow
    rps_menu
    rps_bet_logic
    rps_logic
  else puts "You don't have the funds to play. Since your balance is #{$balance}, I'm sending you back to the main menu.".red
    main_menu   end
end

def rps_menu
  puts "Choose from the options below:\n".yellow
  puts "1) Play"
  puts "2) Cashout And Return To The Casino"
  puts "Please pick an option"
  @input = gets.to_i
  case @input
  when 1
    rps_bet_logic
  when 2
    puts "You have $#{$balance}.".orange
    # {@name} is not functioning
    puts "Thanks for playing Rock, Paper, Scissors #{@name}! Have a good day!".orange
    main_menu
  else
    puts "Please pick a valid option from the menu.".red
    rps_menu
  end
end

def rps_bet_logic
  # {@name} is not functioning
  puts "How much do you want to bet #{@name}?".yellow
  @bet_amt = gets.to_i
  if @bet_amt == 0
    puts "You need to make a bet if you want to play!".red
    rps_bet_logic
  elsif @bet_amt > $balance.to_i
    puts "Please adjust your bet so that it does not exceed your current balance. Your balance is $#{$balance}."
    rps_bet_logic
  else
    puts "You've placed a bet of $#{@bet_amt}. Are you ready to play? (yes/no)".yellow
    option = gets.strip.downcase.to_s
    if option == "yes"
      rps_logic
    else
      puts "Come back when you're ready to play!".red
      rps_menu
    end
  end
end

def rps_logic
  options = ["r", "p", "s"]
  computer_choice = options.sample
  #it's not bringing in @name
  puts "#{@name}, what's your choice? Type [r] for Rock, [p] for Paper or [s] for Scissors"
  @input = gets.strip.downcase
  while !(@input == "r" || @input == "p" || @input == "s")
    puts "Invalid choice. Enter [r]ock, [p]aper or [s]cissors. Please try again."
    @input = gets.strip.downcase
  end
  @rand_choice = options.sample.strip
  rps_game_operator
end

def rps_game_operator
  puts "you: #{@input} computer: #{@rand_choice}"
  # computer guess 's'
  if @input == "r" && @rand_choice == "s"
    puts "Rock beats scissors. You win!"
  elsif @input == "p" && @rand_choice == "s"
    puts "Scissors beats paper. You lose"
  elsif @input == "s" && @rand_choice == "s"
    puts "It's a tie!"
    # computer guess 'p'
  elsif @input == "r" && @rand_choice == "p"
    puts "Paper beats rock. You lose!"
  elsif @input == "p" && @rand_choice == "p"
    puts "It's a tie!"
  elsif @input == "s" && @rand_choice == "p"
    puts "Scissors beats paper. You win"
    # computer guess 'r'
  elsif @input == "r" && @rand_choice == "r"
    puts "It's a tie!"
  elsif @input == "p" && @rand_choice == "r"
    puts "Paper beats rock. You win!"
  elsif @input == "s" && @rand_choice == "r"
    puts "Rock beats scissors. You lose!"
  end
  play_again
end

def play_again
  puts "\n Would you like to play another game?\n1) YES\n2)NO\n"
  yes_no = gets.to_i
  case yes_no
  when 1
    puts "\nPlay again!\n"
    rps_bet_logic
  when 2
    puts "\nBye! Thanks for playing!\n"
    main_menu
  else
    puts "\nInvalid input. Please select an appropriate option.\n"
    play_again
  end
end
