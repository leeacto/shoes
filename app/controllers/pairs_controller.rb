class PairsController < ApplicationController
	def new
		@user = current_user
		@pair = Pair.new
	end

	def create
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
	end


	private
		
		def pair_params
			params.require(:pair).permit(:brand, :model, :nickname, :condition, :description)
		end
end
