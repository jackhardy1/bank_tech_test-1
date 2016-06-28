require_relative './transaction.rb'

class Account

  DEFAULT_BALANCE = 0

  attr_reader :balance, :account_history

  def initialize(balance = DEFAULT_BALANCE, transaction = Transaction)
    @balance = balance
    @transaction = transaction
    @account_history = []
  end

  def deposit(amount, date = DateTime.now)
    @balance += amount
    @account_history << @transaction.new(amount, 0, @balance, date)
  end

  def withdraw(amount, date = DateTime.now)
    fail "insufficient funds" if not_enough_balance?(amount)
    @balance -= amount
    @account_history << @transaction.new(0, amount, @balance, date)
  end

  def print_statement
    puts "date || credit || debit || balance"
    @account_history.reverse_each do |transaction|
      puts transaction.to_s
    end
  end

  private

  def not_enough_balance?(amount)
    @balance < amount
  end
end

a = Account.new

a.deposit(1000)
a.deposit(2000)
a.withdraw(500)
a.print_statement
