class EventsController < ApplicationController
	include EventsHelper
	before_action :set_event,only:[:show,:attend,:unattend]
	before_action :get_attendee,only:[:show,:attend,:unattend]
	

	def index
		@events = Event.order(start_date: :asc)	
	end

	def show;end

	def attend
		fees = (current_user.gender == "Female") ? @event.discount_fees : @event.fees
		current_user.attendees.create(event_id: @event.id,joining_date: Date.today,fee_paid: fees)
	end

	def unattend
		attendee = @event.attendees.where(:user_id=>current_user.id) 
		attendee.destroy_all unless attendee.blank?
	end

	def set_event
		@event = Event.find(params[:id])
	end

	def get_attendee
		@attendee_users = get_attendees_users(@event.id)
	end


end
