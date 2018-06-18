require 'net/http'
require 'uri'
require 'json'

# Delayinfomationextractorは遅延情報を実装するクラスです
#
# Sample
#  p Delayinfomationextractor.search_for_delaying_railway(word)
#  => 大江戸線は遅延しているよ！！
class DelayInfomationExtractor
  # Constants
  API_URL = 'https://rti-giken.jp/fhc/api/train_tetsudo/delay.json'

  def search_for_delaying_railway(word)
    uri = URI.parse(API_URL)
    json = Net::HTTP.get(uri)
    result = JSON.parse(json)

    result.each do |delay_info|
      railway = delay_info['name'].to_s
      return "#{railway}は遅延しているよ！！" if Regexp.new(railway) === word
    end
      return '電車は遅延していないよ'
  end
end
