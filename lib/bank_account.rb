
class BankAccount

  attr_reader :balance, :transactions

  def initialize(balance = 0)
    @balance = balance
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    date =
    @transactions << {:balance => @balance, :credit => amount, :debit => 0, :date => Time.new}
  end

  def withdraw(amount)
    @balance -= amount
  end

end
