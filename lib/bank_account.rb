require 'transaction'

class BankAccount

  attr_reader :balance, :transactions

  def initialize(balance = 0)
    @balance = balance
    @transactions = []
  end

  def deposit(amount)
    @balance += Transaction.new(amount).sum
    @transactions << {:balance => @balance, :credit => amount, :debit => 0, :date => Time.new}
  end

  def withdraw(amount)
    @balance -= Transaction.new(amount).sum
    @transactions << {:balance => @balance, :credit => 0, :debit => amount, :date => Time.new}
  end

end
