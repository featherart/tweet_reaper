class TweetFetcher < ActiveRecord::Base
  
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_KEY"]
      config.consumer_secret     = ENV["TWITTER_SECRET"]
      config.access_token        = ENV["TWITTER_TOKEN"]
      config.access_token_secret = ENV["TWITTER_TOKEN_SECRET"]
    end

    def self.tweet_fetch(name)
      @client.user_timeline(name) 
      #@client.user(name)     
    end

    def self.update_status(text)
      @client.update(text)
    end

    def self.friend_fetch(name)
      @client.friends(name)
    end

end
