require 'date'

class Transaction

  def initialize(credit, debit, balance, date)
    @date = date.strftime("%d/%m/%Y")
    @credit = '%.2f' % credit
    @debit = '%.2f' % debit
    @balance = '%.2f' % balance
  end

  def to_s
    "#{@date} || #{@credit} || #{@debit} || #{@balance}"
  end
end
