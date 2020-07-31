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
    redirect_to "/", notice: "投稿が完了しました！"
  end

  def show
    @post = Post.new
  end

  private
  def post_params
    params.require(:post).permit(:image, :text)
  end
end