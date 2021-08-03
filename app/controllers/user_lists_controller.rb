class UserListsController < ApplicationController
  def index
    @customers = Customer.page(params[:page])
  end

  def new
    @area = Area.new
    @cities = City.where(prefecture_id:0)
  end
  
  
  def create
    @post = Post.new(content:params[:content])
    @post.save
  end
end
