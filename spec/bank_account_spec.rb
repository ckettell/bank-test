require 'bank_account'

describe BankAccount do
  it 'When a user deposits £100 to their account, the balance should be £100' do
    account = BankAccount.new
    account.deposit(100)
    expect(account.balance).to eq(100)
  end
end
