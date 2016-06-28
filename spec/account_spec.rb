require 'account'
require 'rspec/expectations'

describe Account do

  describe 'default settings' do
    it 'has a starting balance of 0 pounds' do
      expect(subject.balance).to eq Account::DEFAULT_BALANCE
    end
  end

    describe '#deposit' do
      it 'can deposit money' do
        subject.deposit(1000)
        expect(subject.balance).to eq 1000
      end
    end

    describe '#withdraw' do
      it 'can withdraw money' do
        subject.deposit(60)
        subject.withdraw(50)
        expect(subject.balance).to eq 10
      end

      it 'cannot withdraw if insufficient balance' do
        expect{subject.withdraw(1)}.to raise_error "insufficient funds"
      end
    end

    describe '#print_statement' do
      it 'prints a statement of all transactions' do
        subject.deposit(1000)
        subject.deposit(2000)
        subject.withdraw(500)
        expect(subject.print_statement).to eq"date || credit || debit || balance
28/06/2016 || 0.00 || 500.00 || 2500.00
28/06/2016 || 2000.00 || 0.00 || 3000.00
28/06/2016 || 1000.00 || 0.00 || 1000.00"
      end
    end
end
