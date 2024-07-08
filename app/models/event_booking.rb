class EventBooking < ActiveRecord::Base
	belongs_to :event
	belongs_to :user
	before_create :calculate_booking_price
	after_create :update_tickets_left

	validate :check_ticket_availability

	private

	def calculate_booking_price
		self.total_price = self.event.entry_fee
	end

	def update_tickets_left
		event = self.event
		tickets = event.tickets_left - 1
		event.update_attributes(tickets_left: tickets)
	end

	def check_ticket_availability
		if self.event.tickets_left <= 0
			errors.add(:event, "Tickets are sold out!")
		end
	end

end
