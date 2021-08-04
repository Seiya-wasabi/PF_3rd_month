class HomesController < ApplicationController
  def top
    
  end
  def index
    @customers = Customer.page(params[:page])
  end

  def new
    @area = Area.new
    @cities = City.where(prefecture_id:0)
  end

end