class HomesController < ApplicationController
  def top
  end
  def show
    @customer = Customer.find(params[:id])
  end
end