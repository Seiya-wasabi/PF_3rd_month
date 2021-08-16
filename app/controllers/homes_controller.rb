class HomesController < ApplicationController
  def top
  end
  
  def create
    @scrape = Area.new.scrape
    @scrapes = @scrape.all
    redirect_to get_cities_areas
  end
end