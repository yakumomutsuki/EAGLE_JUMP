require './delay_infomation_extractor.rb'
require './user_local_api'

# CreateReplySentenceクラスは、返信文作成を実装するクラスです
#
# Sample
#  reply_info = CreateReplySentence.new
#  p reply_info.reply('おはよう')
#  => おはようございます！！
class CreateReplySentence
  attr_accessor :result

  # when 'if' or 'elsif', call methods,
  # 'else' then call a "LocalHost" API response.
  def reply(word: :message)

    # DelayInfomationExtractor
    if word.include?('電車')
      DelayInfomationExtractor.new.search_for_delaying_railway(word)

    # elsif

    # UserLocalAPI
    else
      UserLocalAPI.new.get_message(msg: word)
    end
  end
end
