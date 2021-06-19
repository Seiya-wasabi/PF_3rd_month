class AreasController < ApplicationController
  def new
    @area = Area.new  
  end
  
  def get_cities
    render partial: 'select_city', locals: {prefecture_id: params[:prefecture_id]}
  end
end
