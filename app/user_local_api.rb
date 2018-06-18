require 'http'
require 'json'

# UserLocalAPI as a implements to Replying to Sentences.
#
# Sample
#  UserLocalAPI.get_message(msg: :massage)
#    msg: 今日も１日 => がんばるぞい！
class UserLocalAPI
  USER_LOCAL_URL = 'https://chatbot-api.userlocal.jp/api/chat'.freeze
  API_KEY        = ENV['USER_LOCAL_API_KEY'].freeze

  def get_message(msg: :massage)
    # https://chatbot-api.userlocal.jp/api/chat?key=sample&message=
    uri = "#{USER_LOCAL_URL}?key=#{API_KEY}&message=#{msg}"
    response = HTTP.post(uri)
    rc = JSON.parse(response.body)
    rc['result']
  end
end