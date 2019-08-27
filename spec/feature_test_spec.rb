require 'bank_statement_printer'
require 'bank_account'
require 'timecop'

describe BankStatementPrinter do
  let(:statement_printer) { described_class.new }
  let(:account) { BankAccount.new }

  it 'Handles a deposit' do
    Timecop.freeze(2018, 8, 27) do
      date = Time.new
      account.deposit(100)
      expect(statement_printer.print_bank_statement(account)).to eq('date || credit || debit || balance \\n 27/08/18 || 100.00 || 0.00 || 100.00 \\n')
    end
  end

  it 'Handles a deposit and withdrawal' do
    Timecop.freeze(2018, 8, 2) do
      date = Time.new
      account.deposit(100)
      account.withdraw(80)
      expect(statement_printer.print_bank_statement(account)).to eq('date || credit || debit || balance \\n 02/08/18 || 100.00 || 0.00 || 100.00 \\n 02/08/18 || 0.00 || 80.00 || 20.00 \\n')
    end
  end
end
