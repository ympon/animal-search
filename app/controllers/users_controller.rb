class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @name = current_user.name
    @posts = current_user.posts
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to "/"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find([:id])
  end

end
