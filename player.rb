require_relative "./wallet"
require_relative "./welcome"

class Person < Wallet
  attr_accessor :name, :balance

  def initialize(name, balance)
    #initialize balance and set it to zero.
    @name = nil
    super()
    get_user_info
  end

  def get_user_info
    # `` execute the shell command in ruby. The below clears the terminal.
    puts `clear`
    puts
    puts "Welcome! Let's get you signed up for a game!"
    puts "Type your name below:"
    get_player_name
  end

  def get_player_name
    @name = gets.strip.to_s
    #use RegEx to check that the name is an upper (A-Z) or lowercase (a-z) letters and that it is greater than 3 characters: a{3,}	3 or more of a
    if @name.match(/[a-zA-Z]{3,}/)
      puts
      puts "Hello #{@name}, how much money are you playing with today? Note: Our max is $5,000."
      get_money
      casino = Casino.new
    else
      puts "Please provide a valid name meeting the following criteria: upper (A-Z) or lowercase (a-z) letters greater than 3 characters total. Let's try again."
      puts
      get_player_name
    end
  end

  def get_balance
    puts "How much money are you playing with today?"
    #any string will be zero by default when you call to_i on it.
    input = gets.strip.to_i
    #if the answer is greater than 5000, then set their balance to 5000
    @balance = input
    puts "#{@name}, you're playing with $#{@balance}. Have fun!"
    if @balance > 5000
      puts "\nThat's a bit too much money to gamble with. Maximum allowed is $5,000."
      #this is telling the Ruby program to wait 3.5 sec before moving to the next line of code.
      sleep 3.5
      @balance = 5000
      puts "\n We're limiting your balance to #{@balance}. Your change returned is #{input - @balance}."
    elsif @balance == 0
      puts "Please come back when you have some money to play with."
      exit_program
    else
      #send to next method...place to go.
      main_menu
    end
  end
end
