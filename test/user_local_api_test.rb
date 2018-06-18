require 'minitest/autorun'
require './app/user_local_api'

class UserLocalAPITest < MiniTest::Test
  attr_accessor :obj

  def setup
    @obj = UserLocalAPI.new
  end

  def test_knowledge_database
    assert_equal    'がんばるぞい！' , @obj.get_message(msg: '今日も一日')
    assert_equal    'Qiitaのトレンドを表示するねhttps://qiita.com/trend' , @obj.get_message(msg: 'Qiita')
    assert_equal    'TEL:03-6809-2774' , @obj.get_message(msg: '電話番号')
  end
end