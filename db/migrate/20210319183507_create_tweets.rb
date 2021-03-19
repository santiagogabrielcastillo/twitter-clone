class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :likes
      t.text :content
      t.integer :likes_count
      t.integer :retweets_count
      t.integer :replies_count
      t.boolean :is_retweet
      t.boolean :is_reply
      t.references :source, foreign_key: { to_table: :tweets }

      t.timestamps
    end
  end
end
