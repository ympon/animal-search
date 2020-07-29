class PostsController < ApplicationController
  def index
    # @posts = Post.new
  end

  def get_category_children
    @children = Category.find(params[:parent_id]).children
  end

end
