class UsersController < ApplicationController

  def new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = current_user.posts.order("created_at DESC")
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

end
