class Concerns::ScrapesController < ApplicationController
  module Scrapes
    require 'open-uri'
    require 'nokogiri'
  
    def set_real_property
      url = 'https://paypay.ne.jp/notice/20200604/01/'
  
      charset = nil
      html = open(url) do |f|
        charset = f.charset
        f.read
      end
  
      doc = Nokogiri::HTML.parse(html, nil, charset)
  
      @properties = []
  
      doc.xpath('//div[@class="article__contents post"]').css('tr').each do |node|
        @properties << node.css("td[1]").text
      end
  
      @properties = @properties.drop(1)
      p @properties
    end
  end
end
