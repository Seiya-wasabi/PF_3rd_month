class HomesController < ApplicationController
  def top
  end
  
  def new
    @area = Area.new
    @cities = City.where(prefecture_id:0)
  end
  

  def create
    @scrape = Area.new.scrape
    @scrapes = @scrape.all
    redirect_to get_cities_areas
  end
end