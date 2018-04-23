# Account class is responsible for having a balance
# Account class can deposit and withdraw from balance accordingly
class Account
  attr_reader :balance

  def initialize(
    statement = Statement.new,
    date = DateFormatter.new,
    balance = 0
  )
    @balance = balance
    @date = date
    @statement = statement
  end

  def deposit(amount)
    @balance += amount
    transaction_date = @date.format_date
    @statement.transaction_history << "#{transaction_date} || #{format('%.2f', amount)} ||  || #{format('%.2f', @balance)}"
  end

  def withdraw(amount)
    @balance -= amount
    transaction_date = @date.format_date
    @statement.transaction_history << "#{transaction_date} ||  || #{format('%.2f', amount)} || #{format('%.2f', @balance)}"
  end
end
