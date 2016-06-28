require 'transaction'
require 'rspec/expectations'


describe Transaction do

  let(:test_transaction) {Transaction.new(10,0,10, DateTime.new(2016,06,27))}

  it 'has a date, credit, debit and balance status' do
    expect(test_transaction.to_s).to eq "27/06/2016 || 10.00 || 0.00 || 10.00"
  end
end
