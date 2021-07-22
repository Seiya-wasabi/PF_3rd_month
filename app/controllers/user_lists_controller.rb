class UserListsController < ApplicationController
  def index
    @customers = Customer.page(params[:page])
  end


  def show
    @customer = Customer.find(params[:id])
  end

  def create
    @post = Post.new(content:params[:content])
    @post.save
  end
end
