require 'account'

describe 'Account' do
  let(:subject) { Account.new }

  it 'has a balance attribute beginning with a value of 0' do
    expect(subject.balance).to eq(0)
  end

  describe '#deposit' do
    it 'Adds the deposit amount to balance' do
      subject.deposit(100.00)
      expect(subject.balance).to eq(100.00)
    end

    it 'Adds the transaction as string to statement transaction history' do
      statement = instance_double(
        'Statement',
        transaction_history: ['23-04-2018 || 100.00 ||  || 100.00']
      )
      expect(subject.deposit(100.00)).to eq(statement.transaction_history)
    end
  end

  describe '#withdraw' do
    it 'Subtracts the withdrawal amount from the balance' do
      subject.deposit(100.00)
      subject.withdraw(50.00)
      expect(subject.balance).to eq(50.00)
    end
  end
end
