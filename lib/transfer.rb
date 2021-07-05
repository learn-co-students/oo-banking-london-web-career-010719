require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @status = 'pending'
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if ! @sender.valid? || @sender.balance < @amount
      @status = 'rejected'
      'Transaction rejected. Please check your account balance.'
    elsif @status == 'pending'
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      @status = 'complete'
    end
  end

  def reverse_transfer
    if @status == 'complete'
      @sender.deposit(@amount)
      @receiver.deposit(-@amount)
      @status = 'reversed'
    end
  end

end
