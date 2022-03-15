class Post < ApplicationRecord
  belongs_to :profile
  has_many :likes
  has_many :comments
  has_one_attached :avatar

  broadcasts

  def like?(user_id)

    if Like.where(post: self, profile: User.find(user_id).profile ).count > 0
      return true
    end
    false
  end
end
