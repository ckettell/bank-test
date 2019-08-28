require 'transaction'

class BankAccount

  attr_reader :balance, :transactions

  def initialize(balance = 0)
    @balance = balance
    @transactions = []
  end

  def deposit(amount)
    raise 'Deposit must be an integer' unless amount.is_a? Numeric

    @balance += Transaction.new(amount).sum
    @transactions << {:balance => @balance, :credit => amount, :debit => 0, :date => Time.new}
  end

  def withdraw(amount)
    raise 'Deposit must be an integer' unless amount.is_a? Numeric

    @balance -= Transaction.new(amount).sum
    @transactions << {:balance => @balance, :credit => 0, :debit => amount, :date => Time.new}
  end

end
