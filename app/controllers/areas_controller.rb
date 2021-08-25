class AreasController < ApplicationController
  def new
    @area = Area.new
    @cities = City.where(prefecture_id:0)
  end
  
  

  def create
    @scrape = Area.new.scrape
    @scrapes = @scrape.all
    redirect_to get_cities_areas
  end


  def get_cities
    @cities = City.where(prefecture_id: params[:prefecture_id])
#    render partial: 'select_city', locals: {prefecture_id: params[:prefecture_id]}
  end
end
