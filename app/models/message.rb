class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  scope :between, ->(user1, user2) { where(sender: user1, recipient: user2).or(where(sender: user2, recipient: user1)) }
end
