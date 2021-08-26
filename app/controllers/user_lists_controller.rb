class UserListsController < ApplicationController
  def index
    @customers = Customer.page(params[:page])
  end
  
  
  def new
    @url = RealProperty.new
    @area = Area.new
    @cities = City.where(prefecture_id:0)
  end
end
