require "pry"

class Casino
  attr_accessor :name, :balance

  def initialize(name, balance)
    @name = name
    @balance = balance
  end

  def exit_program
    puts "Thanks for playing! Bye!"
    exit(0)
  end
end
