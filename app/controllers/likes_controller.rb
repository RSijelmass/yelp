class LikesController < ApplicationController
	def new
	end

	def create
		@user = current_user.id
		@post = params[:post_id]

		like_exists = Like.find_by(user_id: @user, post_id: @post)
		if like_exists
			like_exists.destroy
			p "like destroyed"
		else
			@like = Like.new({user_id: @user, post_id: @post})
			@like.save!
			p "like created"
			p Like.where(post_id: @post)
			p Like.where(post_id: @post).size
		end
	end
end
