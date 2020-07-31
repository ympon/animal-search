class PostsController < ApplicationController
  def index
    @posts = Post.all.order("created_at DESC")
    @post = Post.new
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.save!
    redirect_to "/"
  end

  def destroy
    @posts = Post.find(params[:id])
    @posts.destroy
    redirect_back(fallback_location: post_path)
  end

  def edit
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:image, :text)
  end
end