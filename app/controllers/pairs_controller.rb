class PairsController < ApplicationController
	def index
		@user = User.find(params[:user_id])
		@pairs = @user.pairs
	end

	def new
		@user = current_user
		@pair = @user.pairs.build
	end

	def create
		@user = current_user
		@pair = current_user.pairs.build(pair_params)

		if @pair.save
			flash[:success] = 'Shoes Saved!'
			redirect_to user_pair_path(current_user, @pair)
		else
			flash[:error] = 'Your Shoes Were Not Saved'
			render 'new'
		end
	end

	def show
		@pair = Pair.find(params[:id])
		@main_url = main_photo(@pair)	
		@photo = Photo.new
	end

	def edit
		@user = current_user
		@pair = Pair.find(params[:id])
	end

	private
		
		def pair_params
			params.require(:pair).permit(:brand, :model, :nickname, :condition, :description)
		end

		def main_photo(pair)
			if pair.photos.count > 0
				pair.photos.first.shot_url(:main)
			else
				'http://6.kicksonfire.net/wp-content/uploads/2008/07/air-jordan-1-i-black-white-air-jordan-countdown-package-1.jpg'
			end
		end
end
