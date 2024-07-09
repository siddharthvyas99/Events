class EventsController < ApplicationController
  # To-Do : Use Pundit for better authorization
	before_action :authenticate_user!, except: [:index, :home,  :show]
  before_action :load_event, only: [:show, :update, :destroy]

	def index
		@events = Event.all
    #Implement searching and pagination using Pagy gem
	end

	def create
		@event = Event.new(event_params)
		@event.user_id = current_user.id

		if @event.save
			render notice: t("resource.created", { resource_name: "Event" })
		end
	end

	def show
		@event_bookings = @event.event_bookings

		if params[:booking_id]
			@booking_confirmed = current_user.event_bookings.find(params[:booking_id])
		end
	end

	def update
		if @event.update_attributes(event_params)
			render notice: t("resource.updated", { resource_name: "Event" })
		end
	end

	def destroy
		@event.destroy
		render notice: t("resource.deleted", { resource_name: "Event" })
	end

	private

  def load_event
    @_event ||= Event.find(params[:id])
  end

	def event_params
		params[:event].permit(:name, :description, :venue_id, :start_datetime, :end_datetime, :entry_fee, :status)
	end
end
