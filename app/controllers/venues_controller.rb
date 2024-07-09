class VenuesController < ApplicationController
  # To-Do : Use Pundit for better authorization
	before_action :authenticate_user!, except: [:index, :show]
  before_action :find_venue,  only: [:show, :update, :destroy]

	def index
		@venues = Venue.all
    #Implement searching and pagination using Pagy gem
	end

	def create
		@venue = Venue.new(venue_params)
		@venue.user_id = current_user.id
		if @venue.save
			render notice: t("resource.created", { resource_name: "Venue" })
		end
	end

	def show
	end

	def update
		if @venue.update_attributes(venue_params)
			render notice: t("resource.updated", { resource_name: "Venue" })
		end
	end

	def destroy
		if @venue.destroy
      render notice: t("resource.deleted", { resource_name: "Venue" })
		end
	end

	private

  def load_venue
    @_venue ||= Venue.find(params[:id])
  end

	def venue_params
		params[:venue].permit(:name, :address, :user_id, :price)
	end
end
