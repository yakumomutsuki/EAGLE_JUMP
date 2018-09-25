# frozen_string_literal: true

# This Slack Bot is a Simulated by Suzukaze Aoba (Animation of "NEW GAME!!")
# Kyoumo Ichinichi Ganbaru Zoi!
require 'slack-ruby-client'
require './app/create_reply_sentence'

Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
  config.logger = Logger.new(STDOUT)
  config.logger.level = Logger::INFO
  fail 'Missing ENV[SLACK_API_TOKEN]!' unless config.token
end

Slack::RealTime::Client.config do |config|
  config.websocket_ping = 30
end

client = Slack::RealTime::Client.new

client.on :hello do
  puts "Successfully connected, welcome '#{client.self.name}' to the '#{client.team.name}' team at https://#{client.team.domain}.slack.com."
end

client.on :message do |data|
  puts data

  case data.text
  when /^バルス/ then
    client.message channel: data.channel, text: "おやすみなさい"
    client.stop!
  else
    @obj = CreateReplySentence.new
    reply = @obj.reply(word: data['text'])
    client.message channel: data.channel, text: reply
  end
end

client.on :channel_joined do |_data|
  puts 'Joined Channel'
end

client.on :close do |_data|
  puts 'Connection closing, exiting.'
  puts 'Connection has been disconnected.'
  # client.start!
end

client.start!