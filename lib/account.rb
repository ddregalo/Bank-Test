# Account class is responsible for having a balance
# Account class can deposit and withdraw from balance accordingly
class Account
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end
