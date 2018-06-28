require 'pry'

class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount, :count


  @@transactions = []
  
  def initialize(sender, receiver, amount)
  	@sender = sender
  	@receiver = receiver
  	@status = "pending"
  	@amount = amount
  	@count = 0

  end

  def valid? 
  	if sender.valid? && receiver.valid?
  		true 
  	else 
  		false
  	end
  end 
    
  def execute_transaction
  	if self.count == 0 && sender.valid? == true && sender.balance > self.amount
  		 # binding.pry
	  	receiver.deposit(self.amount) 
	  	sender.deposit(-self.amount)
	  	self.status = "complete"
  		self.count += 1
  		@@transactions << self.object_id
  	else
  		self.status = "rejected"
	  	return "Transaction rejected. Please check your account balance."

  	end
  end 

  def self.get_all_transactions
  	@@transactions
  end

  def reverse_transfer
  	@@transactions.each do |x|
  		if self.object_id == x
  			receiver.deposit(-self.amount) 
			sender.deposit(self.amount)
			self.status = "reversed"
		  end
		end
	end


arraay.includes(sean)
 
 end

sean = BankAccount.new ("Sean's account")
lily = BankAccount.new ("Lil's account")
transfer = Transfer.new(sean, lily, 40)
transfer2 = Transfer.new(lily, sean, 75)

transfer.execute_transaction
transfer2.execute_transaction
