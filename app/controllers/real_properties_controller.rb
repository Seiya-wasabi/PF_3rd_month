class RealPropertiesController < ApplicationController
  include Scrapes

  def new
    if params[:format] == "suumo"
      @properties = set_real_property
    end
    @property = Property.new
  end
end
