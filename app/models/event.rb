class Event < ApplicationRecord
	has_many :attendees
	has_many :users,:through => :attendees

	def discount_fees
		self.fees * (1-5/100.to_f) 
	end
end
