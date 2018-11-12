require_relative "./player"

def multiplier(s1, s2, s3)
  if s1==s2 && s2==s3
    3
  elsif s1==s2 || s2==s3 || s1==s3
    2
  else
    0
  end
end

def slots_logo
  puts '
  oooooooo8 ooooo         ooooooo   ooooooooooo  oooooooo8  
  888         888        o888   888o 88  888  88 888         
   888oooooo  888        888     888     888      888oooooo  
          888 888      o 888o   o888     888             888 
  o88oooo888 o888ooooo88   88ooo88      o888o    o88oooo888  
  at DPLcasino
  '
  puts "---WELCOME TO RUBY SLOTS---"
end
 
def run_slots
  slotImageList = %w[Cherry Orange Plum Bell Melon Bar]
  
  loop do
    puts "BALANCE:  $#{$balance}"
    print "How much would you like to bet? "
    @bet_amt = gets.strip.to_i
    if @bet_amt > $balance
      until @bet_amt <= $balance
        puts "Like you have that kind of cash! Try again"
        @bet_amt = gets.chomp.to_i
      end
    end
    $balance -= @bet_amt
 
    slotImage1 = slotImageList.sample
    slotImage2 = slotImageList.sample
    slotImage3 = slotImageList.sample

    puts "||#{slotImage1}||#{slotImage2}||#{slotImage3}||"

    def run_jackpot
      puts "
      ::::::'##::::'###:::::'######::'##:::'##:'########:::'#######::'########:
      :::::: ##:::'## ##:::'##... ##: ##::'##:: ##.... ##:'##.... ##:... ##..::
      :::::: ##::'##:. ##:: ##:::..:: ##:'##::: ##:::: ##: ##:::: ##:::: ##::::
      :::::: ##:'##:::. ##: ##::::::: #####:::: ########:: ##:::: ##:::: ##::::
      '##::: ##: #########: ##::::::: ##. ##::: ##.....::: ##:::: ##:::: ##::::
       ##::: ##: ##.... ##: ##::: ##: ##:. ##:: ##:::::::: ##:::: ##:::: ##::::
      . ######:: ##:::: ##:. ######:: ##::. ##: ##::::::::. #######::::: ##::::
      :......:::..:::::..:::......:::..::::..::..::::::::::.......::::::..:::::
      
      "
      @winnings = 2000
      puts "!YOU WON THE JACKPOT!"
      puts "CONGRADULATIONS, YOU WON $#{@winnings}"
    end

    if slotImage1 == slotImage2 && slotImage2 == slotImage3
      run_jackpot
    else
      @winnings = @bet_amt * multiplier(slotImage1, slotImage2, slotImage3)
      if @winnings > 0
        puts "You won $#{@winnings}!"
      else
        puts "Now you only have $#{$balance}!"
      end
    end

    $balance += @winnings

    print "Would you like to continue? (yes/no)"
    continue_choice = gets.strip.to_s
    if continue_choice == "yes"
      run_slots
    elsif continue_choice == "no"
      main_menu
    else
      puts "Gimme a real answer!"
    end
  end
end

run_slots! if __FILE__==$0



