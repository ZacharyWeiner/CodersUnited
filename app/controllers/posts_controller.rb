class PostsController < ApplicationController
	before_action :set_post, only: [:edit, :update, :destroy]
	
	def create
		@post = current_user.posts.new(post_params)
		if @post.save 
			@post.create_activity key: "post.created", owner: @post.user
			respond_to do |format|
				format.html {redirect_to user_path(@post.user.username), notice: "Post Created!" }
			end 
		else
			redirect_to user_path(@post.user.username), notice: "Post Created!" 
		end 
	end

	def edit

	end 

	def update
		if @post.update(post_params)
			respond_to do |format|
				format.html {redirect_to user_path(@post.user.username), notice: "Post Updated!"}
			end
		else 
			redirect_to post_path(@post), notice: "Post Failed!" 
		end 
	end 
	
	def destroy
		if @post.destroy
			respond_to do |format|
				format.html {redirect_to user_path(@post.user.username), notice: "Post Deleted!"}
			end
		else 
			redirect_to post_path(@post), notice: "Post Deleted!" 
		end 
	end
	private 
	def post_params 
		params.require(:post).permit(:content)
	end 

	def set_post
		@post = Post.find(params[:id]) 
	end
end 