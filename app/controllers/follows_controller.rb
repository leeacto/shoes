class FollowsController < ApplicationController
	def create
		Follow.where(follower_id: current_user.id, followed_id: params[:id]).first_or_create
		if request.xhr?
			redirect_to users_path
		else
			render json: {}
		end
	end

	def destroy
		Follow.where(follower_id: current_user.id, followed_id: params[:id]).destroy
		if request.xhr?
			redirect_to users_path
		else
			render json: {}
		end
	end
end
