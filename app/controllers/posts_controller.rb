class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @posts = Post.includes(:user).order("created_at DESC")
    @post = Post.new
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to "/", notice: "投稿を保存しました！"
    else
      flash.now[:alert] = "『画像』と『名前』を入力してください"
      render :new
    end
  end

  def destroy
    @posts = Post.find(params[:id])
    @posts.destroy
    redirect_back(fallback_location: post_path)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to "/"
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  
  def post_params
    params.require(:post).permit(:image, :text).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end