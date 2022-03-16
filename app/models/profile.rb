class Profile < ApplicationRecord
  after_commit :generate_reindex, on: [:create, :update]

  searchkick
  #scope :with_long_i, -> { where("LENGTH(id) > 20") }

  has_one_attached :avatar


  belongs_to :user
  has_many :posts
  has_many :comments
  has_many :followers
  has_many :likes

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
