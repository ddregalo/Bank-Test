# frozen_string_literal: true

require 'printer'

describe 'Printer' do
  let(:subject) { Printer.new }

  describe '#print_statement' do
    it 'should print the transaction history of an account in reverse order' do
      transaction_history = [
        '23/04/2018 || 100.00 ||  || 100.00',
        '23/04/2018 ||  || 50.00 || 50.00'
      ]
      expect(STDOUT).to receive(:puts).with(
        "DATE || CREDIT || DEBIT || BALANCE\n23/04/2018 ||  || 50.00 || 50.00\n23/04/2018 || 100.00 ||  || 100.00"
      )
      subject.print_statement(transaction_history)
    end
  end
end
