require 'date'

class Transaction

  def initialize(credit, debit, balance, date)
    @date = date
    @credit = credit
    @debit = debit
    @balance = balance
  end

  def to_s
    "#{date_format} || #{credit_format} || #{debit_format} || #{balance_format}\n"
  end

  private

  def date_format
    @date.strftime("%d/%m/%Y")
  end

  def credit_format
    @credit == 0.00 ? "" : '%.2f' % @credit
  end

  def debit_format
    @debit == 0.00 ? "" : '%.2f' % @debit
  end

  def balance_format
    '%.2f' % @balance
  end
end
