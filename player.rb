require "pry"
require_relative "./casino"

class Person < Casino
  attr_accessor :name, :balance

  def initialize
    #initialize balance and set it to zero.
    @balance = 0
    get_user_info
  end

  def get_user_info
    # `` execute the shell command in ruby. The below clears the terminal.
    puts `clear`
    puts "Welcome! Let's get you signed up for a game!"
    puts "Type your name below:"
    @name = gets.strip
    puts `clear`
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
    else
      puts "Please come back when you have some money to play with."
      exit_program
    end
  end
end

Person.new
