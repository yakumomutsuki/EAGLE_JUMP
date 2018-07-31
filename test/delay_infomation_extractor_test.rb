require 'minitest/autorun'
require './app/delay_infomation_extractor'

# Unit-Test
class TestDelayInfomationExtractor < MiniTest::Test
  def setup
    @obj = DelayInfomationExtractor.new
  end

  def test_shinjuku
    check = @obj.search_for_delaying_railway('新宿')
    assert_equal('電車は遅延していないよ', check)
  end

  def test_oedo
    check = @obj.search_for_delaying_railway('大江戸線')
    assert_equal('電車は遅延していないよ', check)
  end
end
