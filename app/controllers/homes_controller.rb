class HomesController < ApplicationController
  def top
  end
  
    def new
    @area = Area.new
    @cities = City.where(prefecture_id:0)
  end
end