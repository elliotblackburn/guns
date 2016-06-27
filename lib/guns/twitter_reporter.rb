require 'twitter'

module Guns
  class TwitterReporter
    def initialize(key, secret, token, token_secret)
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key = key
        config.consumer_secret = secret
        config.access_token = token
        config.access_token_secret = token_secret
      end
    end

    def report_incident(incident)
      tweet = "#{incident.city}, #{incident.state} - Killed: #{incident.num_killed}, Injured: #{incident.num_injured}"
      @client.update(tweet)
      puts "Posting: #{tweet}"
    end
  end
end
