class Profile < ApplicationRecord
  after_commit :generate_reindex, on: [:create, :update]
  searchkick
  validates :name, :user_name, :date_birth, presence: { message: "Datos incompletos"}

  validates :name, length: { minimum: 3, maximum: 35, message: "Minimo 3 y maximo 35 caracteres"}

  validates :user_name, length: { in: 3..10, message: "Minimo 3 y maximo 10 caracteres"}

  has_one_attached :avatar
  belongs_to :user, class_name: User.name
  has_many :posts
  has_many :comments
  has_many :followers
  has_many :likes
  accepts_nested_attributes_for :user, allow_destroy: true, reject_if: :all_blank

  def generate_reindex
    Profile.first.reindex
  end

  def to_follows
    #byebug
    Profile.where.not(id:followers.pluck(:profile_follower_id)).where.not(id: self)
  end

  def follower?(profile_follower)
    followers.where(profile_follower:profile_follower ).exists?
  end

  def cont_profile_follower
    Follower.where(profile_follower: self ).count
  end

  def cont_profile
    followers.where(profile: self).count
  end

end
