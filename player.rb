class Person
  attr_accessor :name, :balance

  def initialize
    # `` execute the shell command in ruby. The below clears the terminal.
    puts `clear`
    puts "Welcome! Let's get you signed up for a game!"
    puts "Type your name below:"
    @name = gets.strip
    puts `clear`
    puts "How much money are you playing with today?"
    input = gets.strip.to_i
    #if the answer is greater than 5000, then set their balance to 5000
    if input > 5000
      puts "\nThat's a bit too much money to gamble with. Maximum allowed is $5,000."
      #this is telling the Ruby program to wait 5 sec before moving to the next line of code.
      sleep 5
      @balance = 5000
      puts "\n We're limiting your balance to #{@balance}. Your change returned is #{input - @balance}."
      #otherwise, the balance is their answer provided.
    else
      @balance = input
      puts "You're playing with $#{@balance}."
    end
  end
end
