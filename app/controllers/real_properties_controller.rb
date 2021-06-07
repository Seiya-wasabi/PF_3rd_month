class RealPropertiesController < ApplicationController
  def new
    @property = Property.new
  end
end
