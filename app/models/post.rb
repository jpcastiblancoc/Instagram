class Post < ApplicationRecord
  validates :description, :avatar, presence: {message: "Datos invalidos"}
  validates :description, length: { minimum: 3, maximum: 50, message: "Minimo 3 y maximo 50 caracteres"}

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

  def date_created
    (created_at.to_time() - 5.hour).strftime("%d-%m-%Y %H:%M")
  end

end
