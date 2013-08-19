class AddTweetsFetchedAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tweets_fetched_at, :time
  end
end
