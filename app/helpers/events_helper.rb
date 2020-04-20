module EventsHelper
	def get_attendees_users(event_id)
		@attendee_users = Attendee.includes(:user).where(event_id: event_id)
	end
end
