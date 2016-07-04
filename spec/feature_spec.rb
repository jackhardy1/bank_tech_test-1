require_relative '../lib/account.rb'

describe Account do

  it 'prints full statement' do
    subject.deposit(1000, DateTime.new(2016,01,10))
    subject.deposit(2000, DateTime.new(2016,01,13))
    subject.withdraw(500, DateTime.new(2016,01,14))
    expect(subject.print_statement).to eq "date || credit || debit || balance\n14/01/2016 ||  || 500.00 || 2500.00\n13/01/2016 || 2000.00 ||  || 3000.00\n10/01/2016 || 1000.00 ||  || 1000.00\n"
  end
end
