class User < ApplicationRecord
 
    has_secure_password
    
    has_many :tweets
    has_many :retweets
    has_many :likes
    
  has_many :liked_tweets, through: :likes, source: :tweet

  has_many :retweeted_tweets, through: :retweets, source: :tweet


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def liked?(tweet)
    liked_tweets.include?(tweet)
  end


  def retweeted?(tweet)
    retweeted_tweets.include?(tweet)
  end
end
