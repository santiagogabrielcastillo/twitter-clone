class ChangeTweets < ActiveRecord::Migration[6.0]
  def change
    change_column :tweets, :is_retweet, :boolean, default: false
    change_column :tweets, :is_reply, :boolean, default: false
  end
end
