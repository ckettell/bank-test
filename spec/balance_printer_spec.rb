require 'balance_printer'
require 'timecop'


describe BalancePrinter do
  let(:my_balance) { double :bank_account }

  it 'Prints the date, credit, debit and balance of each transaction' do
    Timecop.freeze(2019, 8, 27) do
      date = Time.new
      allow(my_balance).to receive(:transactions).and_return([{ :date => date, :credit => 100, :debit => 0, :balance => 100}])
      printer = BalancePrinter.new
      expect(printer.print_bank_statement(my_balance)).to eq('date || credit || debit || balance \n 27/08/19 || 100 || 0 || 100.00')
    end
  end
end
