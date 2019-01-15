require_relative 'transfer.rb'

class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  @@all = []

  def initialize(name, balance=1000, status="open")
    @name = name
    @balance = 1000
    @status = status
    @@all << self
  end

  def self.all
    @@all
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    self.status == "open" && self.balance > 0
  end

  def close_account
    self.status = "closed"
  end

end
