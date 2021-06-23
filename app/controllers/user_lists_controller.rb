class UserListsController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
end
