require 'account'

describe 'Account' do
  let(:subject) { Account.new }

  it 'has a balance attribute beginning with a value of 0' do
    expect(subject.balance).to eq(0)
  end

  describe '#deposit' do
    it 'Adds the deposit amount to balance' do
      subject.deposit(100)
      expect(subject.balance).to eq(100)
    end

    it 'Adds the transaction as string to statement transaction history' do
      statement = instance_double(
        'Statement',
        transaction_history: ['23/04/2018 || 100.00 ||  || 100.00']
      )
      allow(Time).to receive(:now).and_return('2018-04-23 15:00:00 +0100')
      expect(subject.deposit(100)).to eq(statement.transaction_history)
    end
  end

  describe '#withdraw' do
    it 'Subtracts the withdrawal amount from the balance' do
      subject.deposit(100)
      subject.withdraw(50)
      expect(subject.balance).to eq(50)
    end

    it 'Adds the transaction as string to statement transaction history' do
      statement = instance_double(
        'Statement',
        transaction_history: [
          '23/04/2018 || 100.00 ||  || 100.00',
          '23/04/2018 ||  || 50.00 || 50.00'
        ]
      )
      allow(Time).to receive(:now).and_return('2018-04-23 15:00:00 +0100')
      subject.deposit(100)
      expect(subject.withdraw(50)).to eq(statement.transaction_history)
    end

    context 'Client tries to withdraw more than their balance' do
      it 'should raise error' do
        subject.deposit(100)
        expect{ subject.withdraw(200) }.to raise_error(
          "Transaction Denied! Your maximum available balance is 100."
        )
      end
    end
  end

  describe '#show_account_statement' do
    it 'Prints the account transaction history reverse sorted to console' do
      subject.deposit(100)
      subject.withdraw(50)
      expect(STDOUT).to receive(:puts).with(
        "DATE || CREDIT || DEBIT || BALANCE\n23/04/2018 || 100.00 ||  || 100.00\n23/04/2018 ||  || 50.00 || 50.00"
      )
      subject.show_account_statement
    end
  end
end
