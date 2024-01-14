class User < ApplicationRecord
    has_secure_password
    
    has_many :tweets
    has_many :retweets
    has_many :likes
    
  has_many :liked_tweets, through: :likes, source: :tweet

  has_many :retweeted_tweets, through: :retweets, source: :tweet

  # Check if the user has liked a specific tweet
  def liked?(tweet)
    liked_tweets.include?(tweet)
  end

  # Check if the user has retweeted a specific tweet
  def retweeted?(tweet)
    retweeted_tweets.include?(tweet)
  end
end
