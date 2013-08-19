class User < ActiveRecord::Base

  has_many :stored_tweets

  def tweets(count = 10)
    
    tweets = stored_tweets.limit(count)

    if tweets.empty?
      puts '*' * 40
      puts '[LOG] loading tweets from Twitter'
      puts '*' * 40
      fetch_tweets!(count)
    else
      puts '*' * 40
      puts '[LOG] loading tweets from DB'
      puts '*' * 40
      tweets
    end

  end
  
  private

  def fetch_tweets!(count)
    Client.user_timeline(screen_name, {count: count}).each do |tweet|
      stored_tweet = StoredTweet.create({ text: tweet.text, tweeted_at: tweet.created_at })
      stored_tweets << stored_tweet
    end
    return tweets
  end
end
