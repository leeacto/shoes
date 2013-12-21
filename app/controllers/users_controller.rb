class UsersController < ApplicationController
	def index

	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@user.password = params[:password]
		@user.save!
		redirect_to @user
	end

	def show
		@user = User.find(params[:id])
	end

	def update

	end

	def destroy

	end

	private
		
		def user_params
			params.require(:user).permit(:username, :email, :password, :password_confirmation)
		end
end
