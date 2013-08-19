class TwitterUser 
  def self.find_by_username(username)
    Client.user(username)
  end

  def tweets
    @tweets ||= fetch_tweets!
  end

  def fetch_tweets!
  end
end
