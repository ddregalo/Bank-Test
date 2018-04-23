# frozen_string_literal: true

# Printer class puts an account transaction history to console STDOUT
class Printer
  def print_statement(transaction_history)
    account_statement = ['DATE || CREDIT || DEBIT || BALANCE']
    transaction_history.each do |transaction|
      account_statement << transaction
    end
    puts account_statement.join("\n")
  end
end
