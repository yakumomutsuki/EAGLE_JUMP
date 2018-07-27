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

  def test_refine_msg
    assert_equal 'Maisonbookgirl', @obj.refine_msg(msg: 'Maison book girl')
    assert_equal('そういえば私のLINEの一言がずっと下記だった。今日も１日',
                 @obj.refine_msg(msg: 'そういえば私のLINEの一言がずっと下記だった。\n今日も１日'))
  end

end