class HomesController < ApplicationController
  def top
  end
  def show
    @customer = Customer.find(params[:id])
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