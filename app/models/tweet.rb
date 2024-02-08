class Tweet < ApplicationRecord
  after_create :extract_hashtags
  belongs_to :user
  has_many :retweets,dependent: :destroy
  has_many :replies
  has_many :likes ,dependent: :destroy
  has_rich_text :content
  has_many :tweet_hashtags
  has_many :hashtags, through: :tweet_hashtags
  def extract_hashtags
    text_content = content.body.to_plain_text
    hashtags = text_content.scan(/#\w+/)
    hashtags.each do |tag|
      hashtag = Hashtag.find_or_create_by(name: tag.downcase)
      tweet_hashtags.create(hashtag: hashtag)
    end
  end
  def reply_count
    replies.count
  end
end
