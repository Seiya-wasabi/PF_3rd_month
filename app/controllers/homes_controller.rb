class HomesController < ApplicationController
  def top
  end
    def new
    @url = RealProperty.new
    @area = Area.new
    @cities = City.where(prefecture_id:0)
  end
  
  def confirm
    # 入力値のチェック
    @inquiry = Inquiry.new(params[:inquiry].permit(:name, :email, :message))
    if @inquiry.valid?
      # OK。確認画面を表示
      render :action => 'confirm'
    else
      # NG。入力画面を再表示
      render :action => 'index'
    end
  end
  
end