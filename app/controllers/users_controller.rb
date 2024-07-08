class UsersController < ApplicationController
  # To-Do : Use Pundit for better authorization
	before_action :authenticate_user!
  before_action :find_user,  only: [:show, :update, :destroy]

	def index
		@users = User.all
    #Implement searching and pagination using Pagy gem
    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
	end

	def show
	end

	def update
		if @user.update_attributes(user_params)
			render notice: t("resource.updated", { resource_name: "User" })
    else
      render json: @user.errors, status: :unprocessable_entity
		end
	end

	def destroy
		if @user.destroy
      render notice: t("resource.deleted", { resource_name: "User" })
    else
      render json: @user.errors, status: :unprocessable_entity
		end
	end


	private

  def find_user
    @_user ||= User.find(params[:id])
  end

	def user_params
		params[:user].permit(:email, :password, role_ids:[])
	end
end
