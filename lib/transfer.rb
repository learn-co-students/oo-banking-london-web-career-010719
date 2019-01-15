require_relative 'bank_account.rb'
require 'pry'

class Transfer

  attr_accessor :status
  attr_reader :sender, :receiver, :amount

 def initialize(sender, receiver, status="pending", amount)
   @sender = sender
   @receiver = receiver
   @status = status
   @amount = amount
 end

 def valid?
   @sender.valid? && @receiver.valid?
 end

 def execute_transaction
  if @sender.balance < @amount
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  elsif @sender.valid? && @status == "pending"
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = "complete"
  end
 end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
