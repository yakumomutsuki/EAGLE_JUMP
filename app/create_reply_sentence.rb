# frozen_string_literal: true

require 'http'
require 'json'

class CreateReplySentence
  USER_LOCAL_URL = 'https://chatbot-api.userlocal.jp/api/chat'.freeze
  API_KEY        = ENV['USER_LOCAL_API_KEY'].freeze

  # when 'if' or 'elsif', call methods,
  # 'else' then call a "LocalHost" API response.
  def reply(word: :message)
    # DelayInfomationExtractor
    if word.include?('電車')
      DelayInfomationExtractor.new.search_for_delaying_railway(word)

    # elsif

    # UserLocalAPI
    else
      call_user_local_api(msg: word)
    end
  end

  # Call chat bot API
  # https://www.userlocal.jp/
  def call_user_local_api(msg:)
    uri = "#{USER_LOCAL_URL}?key=#{API_KEY}&message=#{msg}"
    response = HTTP.post(uri)
    rc = JSON.parse(response.body)
    rc['result']
  end
end
