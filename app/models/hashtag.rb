class Hashtag < ApplicationRecord
    has_many :tweet_hashtags
    has_many :tweets, through: :tweet_hashtags
    def self.trending_hashtags_past_week
        where(created_at: 1.week.ago..Time.now)
          .group(:name)
          .order(Arel.sql('COUNT(*) ASC'))
          .limit(10)
          .pluck(:name)
      end
end
