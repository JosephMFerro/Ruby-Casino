require_relative "./player"

def rps_logo
  puts 
 " *******                    **     *******                                    ********         **                                        
  /**////**                  /**    /**////**           ******                 **//////         //                                         
  /**   /**   ******   ***** /**  **/**   /**  ******  /**///**  *****  ******/**         *****  **  ******  ******  ******  ******  ******
  /*******   **////** **///**/** ** /*******  //////** /**  /** **///**//**//*/********* **///**/** **////  **////  **////**//**//* **//// 
  /**///**  /**   /**/**  // /****  /**////    ******* /****** /******* /** / ////////**/**  // /**//***** //***** /**   /** /** / //***** 
  /**  //** /**   /**/**   **/**/** /**       **////** /**///  /**////  /**          /**/**   **/** /////** /////**/**   /** /**    /////**
  /**   //**//****** //***** /**//**/**      //********/**     //******/***    ******** //***** /** ******  ****** //****** /***    ****** 
  //     //  //////   /////  //  // //        //////// //       ////// ///    ////////   /////  // //////  //////   //////  ///    //////  "
end

def rps_start
  rps_logo
  rps_bet_logic
  rps_logic
  puts "Welcome to Rock, Paper, Scissors, #{$name}!"
  puts "You have $#{$balance} in your accout."
  rps_menu
end

def rps_menu
  puts "ROCK, PAPER, SCISSORS"
  puts "1) Play"
  puts "2) Cashout And Return To The Casino"
  puts "Please pick an option"
  @input = gets.to_i
  case @input
  when 1
    rps_bet_logic
  when 2
    puts "You have $#{$balance}."
    puts "Thanks for playing Rock, Paper, Scissors #{$name}! Have a good day!"
    main_menu
  else
    puts "Please pick a valid option from the menu."
    rps_menu
  end
end

def rps_bet_logic
  puts "How much do you want to bet #{$name}?"
  @bet_amt = gets.to_i
  if @bet_amt == 0
    puts "You need to make a bet if you want to play!"
    rps_bet_logic
  elsif @bet_amt > $balance.to_i
    puts "Sorry you are broke"
    exit(0)
  else
    puts "You've placed a bet of $#{@bet_amt}. Are you ready to play? (yes/no)"
    option = gets.strip.downcase.to_s
    if option == "yes"
      rps_logic
    else
      puts "Come back when you're ready to play!"
      rps_menu
    end
  end
end

def rps_logic
  options = ["r", "p", "s"]
  computer_choice = options[rand(options.length)]
  #it's not bringing in @name
  puts "#{$name}, what's your choice? Type [r] for Rock, [p] for Paper or [s] for Scissors"
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

  rps_menu
end



rps_start