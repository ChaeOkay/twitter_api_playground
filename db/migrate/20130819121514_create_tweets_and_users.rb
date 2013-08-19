class CreateTweetsAndUsers < ActiveRecord::Migration
  def change
    
    create_table :users do |t|
      t.string :screen_name
      t.timestamps
    end

    create_table :stored_tweets do |t|
      t.belongs_to :user
      t.string :text
      t.date :tweeted_at
    end

  end
end
