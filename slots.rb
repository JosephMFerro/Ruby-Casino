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
  ******** **         *******   **********  ********
  **////// /**        **/////** /////**///  **////// 
 /**       /**       **     //**    /**    /**       
 /*********/**      /**      /**    /**    /*********
 ////////**/**      /**      /**    /**    ////////**
        /**/**      //**     **     /**           /**
  ******** /******** //*******      /**     ******** 
 ////////  ////////   ///////       //     ////////  
  '
puts "---WELCOME TO RUBY SLOTS---"
 
end
def run_slots
  slotImageList = %w[Cherry Orange Plum Bell Melon Bar]
  slots_logo
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
      puts "You have won $#{@winnings}!"
    end

    $balance += @winnings

    print "Would you like to continue? (yes to continue) "
    unless gets.chomp=="yes"
      puts "BALANCE: #{$balance}"
      break
    end
  end
end

run_slots! if __FILE__==$0



