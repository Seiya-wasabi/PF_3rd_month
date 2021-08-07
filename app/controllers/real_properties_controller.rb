class RealPropertiesController < ApplicationController
    require 'nokogiri'
    require 'open-uri'

  def new
    @url = RealProperty.new
    @area = Area.new
    @cities = City.where(prefecture_id:0)
  end

  def create
    #binding.pry
    # sleep 1　#先方への配慮
    # "https://suumo.jp/jj/chintai/ichiran/FR301FC005/?shkr1=03&cb=0.0&shkr3=03&shkr2=03&mt=9999999&sc=28228&ar=060&bs=040&shkr4=03&ct=9999999&srch_navi=1&cn=9999999&mb=0&ta=28&fw2=&et=9999999"
    # url = RealProperty.new(url_params)
    # NokogiriでURLの情報を取得する
    #url = RealProperty.new(url_params)
    #url.save
      begin
        doc = Nokogiri::HTML(open(url_params[:url]),nil,"utf-8")
        rents = []
          doc.css('.detailbox-property-point').each do |rent|
            rents << rent.text
          end
          next_link = doc.css('#pager > ul > li > a.next')
      end until next_link.empty?
      rents = rents.map!{|s|s.sub('万円','')} # 配列内を数字だけに
      rents = rents.map!(&:to_f) # 配列の要素を変動小数型に変換
      rent_average = rents.sum.fdiv(rents.length) #平均を算出して代入
      rent_max = rents.max
      rent_min = rents.min
      rent_db = RealProperty.new(rent: rent_average, url: url_params, max_rent: rent_max, min_rent: rent_min)
      # 平均・url・最大家賃・最低家賃をそれぞれカラムに紐づけて保存
      rent_db.save
      redirect_to real_properties_path
  end

  def index
    @rents = RealProperty.page(params[:page]).reverse_order
    @all_ranks = Note.find(Like.group(:note_id).order('count(note_id) desc').limit(3).pluck(:note_id))
  end

  # require 'open-uri' # URLアクセス
  # require 'kconv'    # 文字コード変換
  # require 'nokogiri' # スクレイピング

  # def create
  #     # 対象のURL
  #     url = "https://suumo.jp/jj/chintai/ichiran/FR301FC001/?ar=060&bs=040&ta=28&sc=28222&cb=0.0&ct=9999999&et=9999999&cn=9999999&mb=0&mt=9999999&shkr1=03&shkr2=03&shkr3=03&shkr4=03&fw2=&srch_navi=1"
  #     # NokogiriでURLの情報を取得する
  #     doc = Nokogiri::HTML(open(url),nil,"utf-8")
  #     doc.css('.cassetteitem_price--rent').each do |link|
  #       puts link.content
  #     end
  # end
  def get_cities
    @cities = City.where(prefecture_id: params[:prefecture_id])
#    render partial: 'select_city', locals: {prefecture_id: params[:prefecture_id]}
  end

    private
  # ストロングパラメータ
  def url_params
    params.require(:real_property).permit(:url)
  end

  # def rent_params
  #   params.require(:real_properties).permit(:rent)
  # end
end #class全体


  # def index
  #   # スクレイピング先のURL
  #   url = 'https://suumo.jp/jj/chintai/ichiran/FR301FC001/?ar=060&bs=040&ta=28&sc=28222&cb=0.0&ct=9999999&et=9999999&cn=9999999&mb=0&mt=9999999&shkr1=03&shkr2=03&shkr3=03&shkr4=03&fw2=&srch_navi=1'

  #   html = open(url) do |f|
  #     f.read # htmlを読み込んで変数htmlに渡す
  #   end

  #   # htmlをパース(解析)してオブジェクトを生成(utf-8に変換）
  #   doc = Nokogiri::HTML.parse(html.toutf8, nil, 'utf-8')

  #   latest_id = get_latest_id()

  #   # 新着情報ごとにループ
  #   doc.css('.cassetteitem_price--rent').each do |content|

  #     # <a name="news123"> の123の部分を取得
  #     feed_id  = content["name"].sub(/news/, "").to_i

  #     if latest_id < feed_id
  #       # DBに未登録の情報があったらDBに保存
  #       title            = content.css('h1').to_html
  #       description      = content.to_html
  #       link             = url + '#news' + feed_id.to_s
  #       insert_feed(feed_id, title, description, link)
  #     end
  #   end

  #   render :text => "Done!"
  # end

  # private
  # # feedsテーブルに1件INSERT
  # def insert_feed(feed_id, title, description, link)
  #   feed = Feed.new(
  #     :feed_id          => feed_id,
  #     :title            => title,
  #     :description      => description,
  #     :link             => link
  #   )
  #   feed.save
  # end

  # # DBに保存されている最新のfeed_idを取得
  # def get_latest_id()
  #   row = Feed.order("feed_id desc").first
  #   if row.nil?
  #     return 0
  #   end
  #   latest_id = row["feed_id"].to_i
  #   return latest_id
  def create
    @post = Post.new(content:params[:content])
    @post.save
  end
  
  def show
    @customer = Customer.find(params[:id])
  end