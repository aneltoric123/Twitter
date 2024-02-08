class CreateTweetHashtags < ActiveRecord::Migration[7.1]
  def change
    create_table :tweet_hashtags do |t|
      t.references :tweet, null: false, foreign_key: true
      t.references :hashtag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
