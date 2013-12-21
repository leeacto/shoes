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
	end

	def update

	end

	def destroy

	end

	private
		
		def user_params
			params.require(:username, :email, :password)
		end
end
