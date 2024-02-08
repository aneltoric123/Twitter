class Tweet < ApplicationRecord
  belongs_to :user
  has_many :retweets,dependent: :destroy
  has_many :replies
  has_many :likes ,dependent: :destroy
  has_rich_text :content
  def reply_count
    replies.count
  end
end
