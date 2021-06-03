require 'nokogiri'
require 'open-uri'

url = "https://www.sejuku.net/blog/"
contents = Nokogiri::HTML(open(url),nil,"utf-8")

puts contents