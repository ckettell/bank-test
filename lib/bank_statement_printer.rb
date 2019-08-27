
class BankStatementPrinter

  def print_bank_statement(bank_account)

    printed = ['date || credit || debit || balance \\n']

    bank_account.transactions.each do |transaction|
      printed << " #{transaction[:date].strftime("%d/%m/%y")} || #{"%.2f" % transaction[:credit]} || #{"%.2f" % transaction[:debit]} || #{"%.2f" % transaction[:balance]} \\n"
    end
  printed.join('')
  end

end
