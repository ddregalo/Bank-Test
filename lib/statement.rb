# frozen_string_literal: true

# Statement class records all transactions for a client
class Statement
  attr_reader :transaction_history

  def initialize(transaction_history = [])
    @transaction_history = transaction_history
  end
end
