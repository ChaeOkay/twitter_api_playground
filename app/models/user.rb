class User < ActiveRecord::Base

  has_many :stored_tweets


  def tweets(count = 2)
    tweets = stored_tweets.limit(count)
    fetch_tweets!(count) if tweets.empty? || tweets_stale?
    return stored_tweets
  end
  
  private

  def tweets_stale?
    # p '*' * 50
    # p tweets_fetched_at
    # p Time.now
    # p (Time.now - tweets_fetched_at)
    # p 15.minutes
    # p '*' * 50
    p (tweets_fetched_at.nil? || ((Time.now - tweets_fetched_at) > 15.minutes))
  end

  def fetch_tweets!(count)
    
    self.tweets_fetched_at = Time.now
    self.save
    
    Client.user_timeline(screen_name, {count: count}).each do |tweet|
      stored_tweet = StoredTweet.create({ text: tweet.text, tweeted_at: tweet.created_at })
      stored_tweets << stored_tweet
    end

  end
end
