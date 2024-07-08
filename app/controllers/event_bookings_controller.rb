class EventBookingsController < ApplicationController
  # To-Do : Use Pundit for better authorization
	before_action :authenticate_user!, except: [:index, :home,  :show]
  before_action :set_event_booking, only: [:show, :update, :destroy]

  def index
    @event_bookings = EventBooking.includes(:user, :event).all
    #Implement searching and pagination using Pagy gem
  end

  def show
  end

  def create
    @event_booking = EventBooking.new(event_booking_params)
    @event_booking.user_id = current_user.id
    @event_booking.event_id = params[:event_id]
    respond_to do |format|
      if @event_booking.save
        render notice: t("resource.created", { resource_name: "Event booking" })
      else
        format.json { render json: @event_booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event_booking.update(event_booking_params)
        format.json { render notice: t("resource.updated", { resource_name: "Event booking" }) }
      else
        format.json { render json: @event_booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @event_booking.destroy
      respond_to do |format|
        format.json { render notice: t("resource.destroyed", { resource_name: "Event booking" }) }
      end
    else
      format.json { render json: @event_booking.errors, status: :unprocessable_entity }
    end
  end

  private
    def set_event_booking
      @event_booking ||= EventBooking.find(params[:id])
    end

    def event_booking_params
      params.require(:event_booking).permit(:event_id, :user_id, :total_price)
    end
end
