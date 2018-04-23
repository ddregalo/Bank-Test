# Account class is responsible for having a balance
# Account class can deposit and withdraw from balance accordingly
class Account
  attr_reader :balance

  def initialize(
    statement = Statement.new,
    date = DateFormatter.new,
    balance = 0,
    printer = Printer.new
  )
    @balance = balance
    @date = date
    @statement = statement
    @printer = printer
  end

  def deposit(amount)
    @balance += amount
    transaction_date = @date.format_date
    @statement.transaction_history << "#{transaction_date} || #{format('%.2f', amount)} ||  || #{format('%.2f', @balance)}"
  end

  def withdraw(amount)
    raise "Transaction Denied! Your maximum available balance is 100." if amount > @balance
    @balance -= amount
    transaction_date = @date.format_date
    @statement.transaction_history << "#{transaction_date} ||  || #{format('%.2f', amount)} || #{format('%.2f', @balance)}"
  end

  def show_account_statement
    @printer.print_statement(@statement.transaction_history)
  end
end
