class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @posts = Post.includes(:user).limit(10).order("created_at DESC")
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
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def destroy
    @posts = Post.find(params[:id])
    @posts.destroy
    redirect_to "/", notice: "投稿を削除しました！"
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
    @posts = Post.where(category_id: params[:category_id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def search
    @posts = Post.search(params[:keyword])
  end

  private
  
  def post_params
    params.require(:post).permit(:image, :text, :category_id, :area_id).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end