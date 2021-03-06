class FollowsController < ApplicationController
	def follow
		f = Follow.where(follower_id: current_user.id, followed_id: params[:id]).first_or_create
		if request.xhr?
			render json: {}
		else
			#render json: {url: "users/#{current_user.id}/follows/?id=#{f.id}"}
			redirect_to users_path
		end
	end

	def unfollow
		f = Follow.where(follower_id: current_user.id, followed_id: params[:id])
		f.first.destroy if !f.empty?
		if request.xhr?
			render json: {}
		else
			#render json: {url: "users/#{current_user.id}/follow/?id=#{params[:id]}"}
			redirect_to users_path
		end
	end
end
