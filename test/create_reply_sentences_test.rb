# frozen_string_literal: true

require 'minitest/autorun'
require './app/create_reply_sentence.rb'

class CreateReplySentencesTest < MiniTest::Test
  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @obj = CreateReplySentence.new
  end

  def test_call_user_local_api
    p msg = @obj.call_user_local_api(msg: '今日も一日')
    assert_equal 'がんばるぞい！', msg

    p msg = @obj.call_user_local_api(msg: 'Qiita')
    assert_equal 'Qiitaのトレンドを表示するねhttps://qiita.com/trend', msg
  end
end