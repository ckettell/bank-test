require 'bank_statement_printer'
require 'timecop'


describe BankStatementPrinter do
  let(:my_balance) { double :bank_account }

  it 'Prints the date, credit, debit and balance of each transaction' do
    Timecop.freeze(2019, 8, 27) do
      date = Time.new
      allow(my_balance).to receive(:transactions).and_return([{ :date => date, :credit => 100, :debit => 0, :balance => 100}])
      printer = BankStatementPrinter.new
      expect(printer.print_bank_statement(my_balance)).to eq('date || credit || debit || balance \\n 27/08/19 || 100.00 || 0.00 || 100.00 \\n')
    end
  end

  it 'Takes on a bank statement which credits and debits' do
    Timecop.freeze(2019, 8, 27) do
      date = Time.new
      allow(my_balance).to receive(:transactions).and_return([{ :date => date, :credit => 100, :debit => 0, :balance => 100}, { :date => date, :credit => 0, :debit => 50, :balance => 50}])

      printer = BankStatementPrinter.new
      expect(printer.print_bank_statement(my_balance)).to eq('date || credit || debit || balance \\n 27/08/19 || 100.00 || 0.00 || 100.00 \\n 27/08/19 || 0.00 || 50.00 || 50.00 \\n')
    end
  end
end
