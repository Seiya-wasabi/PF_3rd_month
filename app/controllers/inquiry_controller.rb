class InquiryController < ApplicationController
  def index
    # 入力画面を表示
    @inquiry = Inquiry.new
    render :action => 'index'
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
  
  def create
    @scrape = Area.new.scrape
    @scrapes = @scrape.all
    redirect_to get_cities_areas
  end

  def thanks
    # メール送信
    @inquiry = Inquiry.new(params[:inquiry].permit(:name, :email, :message))    
    InquiryMailer.received_email(@inquiry).deliver

    # 完了画面を表示
    render :action => 'thanks'
  end
end