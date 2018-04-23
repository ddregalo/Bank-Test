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
  end
end
