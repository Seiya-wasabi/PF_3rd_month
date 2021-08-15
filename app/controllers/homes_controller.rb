class HomesController < ApplicationController
  def top
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
end