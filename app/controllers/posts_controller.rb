class PostsController < ApplicationController
  def index
    @posts = Post.new
  end

  def new
    @post = Post.new
  end
  
end