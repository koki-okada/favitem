require 'net/http'
require 'uri'
require 'json'

puts "検索したい文言を入力してください！"
search_word = gets.chomp

appid = ENV["RAKUTEN_APP_ID"]

url = URI.parse(URI.escape("https://app.rakuten.co.jp/services/api/IchibaItem/Search/20140222?applicationId=#{appid}&keyword=#{search_word}"))
res = Net::HTTP.start(url.host, url.port, use_ssl: true){|http|
    http.get(url.path + "?" + url.query);
}
obj = JSON.parse(res.body)
puts obj