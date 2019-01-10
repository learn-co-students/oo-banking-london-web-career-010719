require_relative 'bank_account.rb'

class Transfer

  attr_accessor :sender, :receiver, :amount, :status


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
  @sender.valid?  && @receiver.valid? && @amount < @sender.balance && @status == "pending"
end

def execute_transaction
  if !valid?
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  else
    @receiver.balance += @amount
    @sender.balance -= @amount
    @status = "complete"
  end
end


def reverse_transfer
  if @status == "complete"
     @receiver.balance -= @amount
     @sender.balance += @amount
     @status = "reversed"
  end
end


#class end
end
