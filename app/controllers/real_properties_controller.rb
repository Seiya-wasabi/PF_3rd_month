class RealPropertiesController < ApplicationController
  def new
    require 'nokogiri'
    require 'open-uri'
    sleep 1　#先方への配慮
    # binding.pry
    @rents = []

    url = "https://suumo.jp/jj/chintai/ichiran/FR301FC005/?shkr1=03&cb=0.0&shkr3=03&shkr2=03&mt=9999999&sc=28228&ar=060&bs=040&shkr4=03&ct=9999999&srch_navi=1&cn=9999999&mb=0&ta=28&fw2=&et=9999999"
    # NokogiriでURLの情報を取得する
    doc = Nokogiri::HTML(open(url),nil,"utf-8")
    begin
      doc.css('.cassetteitem_price--rent').each do |rent|
        @rents << rent.text
      end
        next_link = doc.css('.pagination-parts')
        unless next_link.empty?
          url + "page"
        end
    end until next_link.empty?
  end
      @rents << rent.text
    
    @rents = @rents.map!{|s|s.sub('万円','')} # 配列内を数字だけに
    @rents = @rents.map!(&:to_f) # 配列の要素を整数型に変換
    @rent = @rents.sum.fdiv(@rents.length)
  end

  require 'open-uri' # URLアクセス
  require 'kconv'    # 文字コード変換
  require 'nokogiri' # スクレイピング

  def create
      # 対象のURL
      url = "https://suumo.jp/jj/chintai/ichiran/FR301FC001/?ar=060&bs=040&ta=28&sc=28222&cb=0.0&ct=9999999&et=9999999&cn=9999999&mb=0&mt=9999999&shkr1=03&shkr2=03&shkr3=03&shkr4=03&fw2=&srch_navi=1"
      # NokogiriでURLの情報を取得する
      doc = Nokogiri::HTML(open(url),nil,"utf-8")
      doc.css('.cassetteitem_price--rent').each do |link|
        puts link.content
      end
  end

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
  # end
end
