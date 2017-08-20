class LikesController < ApplicationController
	def new
	end

	def create
		@user = current_user.id
		@post = params[:post_id]
		@score = params[:score]

		like_exists = Like.find_by(user_id: @user, post_id: @post)
		if like_exists
			like_exists.destroy
		else
			@like = Like.new({user_id: @user, post_id: @post, score: @score})
			@like.save!
			p @like
		end
	end
end
