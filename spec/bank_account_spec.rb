require 'bank_account'
require 'timecop'


describe BankAccount do
  it 'When a user deposits £100 to their account, the balance should be £100' do
    account = BankAccount.new
    account.deposit(100)
    expect(account.balance).to eq(100)
  end

  it "withdraws money from the user's account" do
    account = BankAccount.new
    account.deposit(100)
    account.withdraw(50)
    expect(account.balance).to eq(50)
  end

  it 'When a user makes a deposit, it records the date, amount and balance' do
    Timecop.freeze(2019, 8, 27) do
      date = Time.new
      account = BankAccount.new
      account.deposit(100)
      expect(account.transactions.last).to eq({ :date => date, :credit => 100, :debit => 0, :balance => 100})
    end
  end

  it 'When a user withdraws, it records the date, amount and balance' do
    Timecop.freeze(2019, 8, 27) do
      date = Time.new
      account = BankAccount.new
      account.deposit(100)
      account.withdraw(50)
      expect(account.transactions.last).to eq({ :date => date, :credit => 0, :debit => 50, :balance => 50})
    end
  end
end
