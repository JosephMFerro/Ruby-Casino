class Wallet
  def initialize
    #we want to initialize the wallet on creation and set the initial balance to the default of nil. nil is a special Ruby data type that means "nothing", equivalent to null or None in other programming languages.
    @balance = nil
  end

  #we take in the argument of amount and increase or decrease the @balance by that number.
  def increase_balance(amount)
    @balance += amount
  end

  def decrease_balance(amount)
    @balance -= amount
  end
end
