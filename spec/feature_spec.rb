require_relative '../lib/account.rb'
require 'rspec/expectations'

describe Account do

  let(:client) {Account.new}

  it 'prints full statement' do
    client.deposit(1000, DateTime.new(2012,01,10))
    client.deposit(2000, DateTime.new(2012,01,13))
    client.withdraw(500, DateTime.new(2012,01,14))
    expect(client.print_statement).to eq "date || credit || debit || balance
    14/01/2012 || || 500.00 || 2500.00
    13/01/2012 || 2000.00 || || 3000.00
    10/01/2012 || 1000.00 || || 1000.00"
  end
end
