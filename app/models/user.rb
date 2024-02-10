class User < ApplicationRecord
 
    has_secure_password
    
    has_many :tweets
    has_many :retweets
    has_many :likes
    has_many :replies, dependent: :destroy
    
  has_many :liked_tweets, through: :likes, source: :tweet

  has_many :retweeted_tweets, through: :retweets, source: :tweet

 has_many :sent_messages, class_name: "Message", foreign_key: "sender_id", dependent: :destroy
  has_many :received_messages, class_name: "Message", foreign_key: "recipient_id", dependent: :destroy
 
  has_many :followings, foreign_key: :follower_id, dependent: :destroy
  has_many :followed_users, through: :followings, source: :followed

  has_many :followings, foreign_key: :follower_id, dependent: :destroy
  has_many :followed_users, through: :followings, source: :followed

  has_many :reverse_followings, foreign_key: :followed_id, class_name: 'Following', dependent: :destroy
  has_many :followers, through: :reverse_followings, source: :follower

  def follow(user)
    followed_users << user unless self == user || followed_users.include?(user)
  end
  
  def unfollow(user)
    followed_users.delete(user)
  end

  def following?(user)
    followed_users.include?(user)
  end
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end
  def conversations
    sent_recipients = Message.where(sender_id: self.id).pluck(:recipient_id)
    received_senders = Message.where(recipient_id: self.id).pluck(:sender_id)
    User.where(id: (sent_recipients + received_senders).uniq)
  end

  def liked?(tweet)
    liked_tweets.include?(tweet)
  end
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "id", "id_value", "password_digest", "updated_at", "username"]
  end


  def retweeted?(tweet)
    retweeted_tweets.include?(tweet)
  end
end
