class Post < ApplicationRecord
  validates :avatar, presence: {message: "Invalid data"}
  validates :description, length: { minimum: 0, maximum: 50, message: "Maximum 50 characters"}

  belongs_to :profile
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :avatar

  broadcasts


  def like?(user_id)
    if Like.where(post: self, profile: User.find(user_id).profile ).count > 0
      return true
    end
    false
  end

  def date_created
    (created_at.to_time() - 5.hour).strftime("%d-%m-%Y %H:%M")
  end

  def profile_likes
    self
    likes.map{|like|like.profile}
  end
end
