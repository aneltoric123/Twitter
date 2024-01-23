class User < ApplicationRecord
    has_secure_password
    
    has_many :tweets
    has_many :retweets
    has_many :likes
    
  has_many :liked_tweets, through: :likes, source: :tweet

  has_many :retweeted_tweets, through: :retweets, source: :tweet

  has_many :active_follows, class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy
  has_many :following, through: :active_follows, source: :followed

  # Check if the user is following another user
  def following?(other_user)
    following.include?(other_user)
  end



  def liked?(tweet)
    liked_tweets.include?(tweet)
  end


  def retweeted?(tweet)
    retweeted_tweets.include?(tweet)
  end
end
