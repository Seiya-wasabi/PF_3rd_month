      require 'nokogiri'
      require 'open-uri'
  
      # 対象のURL
      url = "https://suumo.jp/jj/chintai/ichiran/FR301FC001/?ar=060&bs=040&ta=28&sc=28222&cb=0.0&ct=9999999&et=9999999&cn=9999999&mb=0&mt=9999999&shkr1=03&shkr2=03&shkr3=03&shkr4=03&fw2=&srch_navi=1"
      # NokogiriでURLの情報を取得する
      doc = Nokogiri::HTML(open(url),nil,"utf-8")
      doc.css('.cassetteitem_price--rent').each do |link|
        puts link.content
      end