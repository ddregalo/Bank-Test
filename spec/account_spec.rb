require 'account'

describe 'Account' do
  it 'has a balance attribute beginning with a value of 0' do
    account = Account.new
    expect(account.balance).to eq(0)
  end
end
