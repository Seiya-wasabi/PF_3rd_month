class HomesController < ApplicationController
  def top
  end
  def index
    # 入力画面を表示
    @inquiry = Inquiry.new
    render :action => 'index'
  end
  
end