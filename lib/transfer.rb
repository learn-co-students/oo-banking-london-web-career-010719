class Transfer
  # your code here

      attr_reader :sender, :receiver, :amount, :status

      def initialize(sender, receiver, amount)
        @sender = sender
        @receiver = receiver
        @amount = amount
        @status = "pending"

      end

      def valid?
        self.sender.valid? && self.receiver.valid?

      end

      def execute_transaction

              if !self.sender.valid? || self.sender.balance < @amount
                @status = "rejected"
                return "Transaction rejected. Please check your account balance."

            elsif @status == "pending"

                self.sender.balance  -= @amount
                self.receiver.balance += @amount
                @status = "complete"

            end

      end

      def reverse_transfer

          if @status == "complete"
            self.receiver.balance -= @amount
            self.sender.balance  += @amount
            @status = "reversed"

          end
      end

end
