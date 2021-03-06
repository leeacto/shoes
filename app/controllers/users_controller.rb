class UsersController < ApplicationController
	def index
		@users = User.includes(:pairs)
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@user.password = params[:user][:password]
		if @user.save
			session[:user_id] = @user.id
			redirect_to @user
	  else
			flash[:error] = "The Username/Password is Invalid"
			redirect_to new_user_path
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def update

	end

	def destroy

	end

	def followers
		@user = User.find(params[:user_id])
		@users = @user.followers
		render 'index'
	end

	def following
		@user = User.find(params[:user_id])
		@users = @user.followeds
		render 'index'
	end

	private
		
		def user_params
			params.require(:user).permit(:username, :email, :password, :password_confirmation)
		end
end
