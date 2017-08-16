class PostsController < ApplicationController
	before_action :require_login

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
	end

	def create
		@post = Post.create(post_params)
		redirect_to @post
	end

	private

	def post_params
		p current_user.id
		params.require(:post).permit(:title, :text).merge(user_id: current_user.id)
	end
end
