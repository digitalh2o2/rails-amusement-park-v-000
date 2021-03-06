class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create 
		@user = User.create(user_params)
		session[:user_id] = @user.id
		redirect_to user_path(@user)
	end

	def show
		@user = User.find_by(id: params[:id])
	end


	private

	def user_params
		params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
	end
end
