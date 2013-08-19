class TwitterUser

  def self.find_by_screen_name(screen_name)
    self.new(screen_name)
  end

  attr_reader :screen_name
  def initialize(screen_name)
    @screen_name = screen_name
  end

  def user
    begin
      self.new(Client.user(@screen_name))
    rescue Twitter::Error::NotFound
      return nil
    end
  end

  def tweets(count = 10)
    fetch_tweets!(count)
  end

  def fetch_tweets!(count)
    Client.user_timeline(@screen_name, {count: count}).map(&:text)
  end
end
