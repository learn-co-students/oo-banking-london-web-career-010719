require "pry"

class Transfer
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  attr_accessor :sender, :receiver, :amount, :status

  def valid?
    self.sender.valid? && self.receiver.valid? && @sender.balance > @amount
  end

  def execute_transaction
    if valid? && @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if valid? && @status == "complete"
    #  binding.pry
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

end
