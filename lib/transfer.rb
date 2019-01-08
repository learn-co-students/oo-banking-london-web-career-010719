class Transfer
   attr_accessor :sender, :receiver, :amount, :status

   def initialize(sender, receiver, amount)
     @sender =sender
     @receiver =receiver
     @amount =amount
     @status = "pending"
   end

   def valid?
     @sender.valid? && @receiver.valid?
   end

   def execute_transaction
     # binding.pry
     if @sender.balance < @amount
        @status = "rejected"
       "Transaction rejected. Please check your account balance."
     elsif valid? && @status == "pending"
        @receiver.balance += amount
        @sender.balance -= amount
        @status = "complete"
     end
   end

   def reverse_transfer
     # if @status == "complete"
     #   @receiver.balance -= amount
     #   @sender.balance += amount
     #   @status = "reversed"
     # end
     if @receiver.balance < @amount
        @status = "rejected"
       "Transaction rejected. Please check your account balance."
     elsif valid? && @status == "complete"
        @receiver.balance -= amount
        @sender.balance += amount
        @status = "reversed"
     end
   end
end
