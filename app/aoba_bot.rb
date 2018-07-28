# This Slack Bot is a Simulated by Suzukaze Aoba (Animation of "NEW GAME!!")
# Kyoumo Ichinichi Ganbaru Zoi!
require 'http'
require 'json'
require 'eventmachine'
require 'faye/websocket'
require './create_reply_sentence'

response = HTTP.post('https://slack.com/api/rtm.start', params: {
                       token: ENV['SLACK_API_TOKEN']
                     })

rc = JSON.parse(response.body)

url = rc['url']

EM.run do
  # Raise Web Socket
  ws = Faye::WebSocket::Client.new(url)

  # When Connection is succeed
  ws.on :open do
    p [:open]
  end

  ws.on :message do |event|
    data = JSON.parse(event.data)

    puts data
    puts '------------------'

    if data['type'] == 'message' && data['message'].nil?
      if /バルス/.match?(data['text'])
        EM.stop
        ws = nil
      end

      @obj = CreateReplySentence.new
      reply = @obj.reply(word: data['text'])
      if reply
        ws.send({
          type: 'message',
          text:  reply.to_s,
          channel: data['channel']
        }.to_json)
      end
    end
  end

  # When Connection is closed
  ws.on :close do
    p [:close, event.code]
    ws = nil
    EM.stop
  end
end
