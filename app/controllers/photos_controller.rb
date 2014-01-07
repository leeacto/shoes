class PhotosController < ApplicationController
	def create
		photo = Photo.new(photo_params)
		if photo.save
			flash[:success] = 'Photo added to pair'
		else
			flash[:error] = 'Error: Photo not added'
	  end
		redirect_to user_pair_path(current_user, photo.pair)
	end

	private
		def photo_params
			params.require(:photo).permit(:pair_id, :url, :ordinal, :shot)
		end
end
