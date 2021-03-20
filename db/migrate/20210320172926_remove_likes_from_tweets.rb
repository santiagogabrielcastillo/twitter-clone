class RemoveLikesFromTweets < ActiveRecord::Migration[6.0]
  def change
    remove_column :tweets, :likes
  end
end
