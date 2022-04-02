class Profile < ApplicationRecord
  after_commit :generate_reindex, on: [:create, :update]
  searchkick

  validates :user_name, uniqueness: true

  validates :name, :user_name, :date_birth, presence: { message: "Incomplete data"}

  validates :name, length: { minimum: 3, maximum: 35, message: "Minimum 3 and maximum 35 characters"}

  validates :user_name, length: { in: 3..40, message: "Minimum 3 and maximum 10 characters"}

  has_one_attached :avatar
  belongs_to :user, class_name: User.name
  has_many :posts
  has_many :comments
  has_many :followers
  has_many :likes
  accepts_nested_attributes_for :user, allow_destroy: true, reject_if: :all_blank


  validate :validate_age

  def validate_age
    if date_birth.present? && date_birth > (Date.today - 4748)
      errors.add(:date_birth, "must be over 13 years old")
    end
  end


  def generate_reindex
    Profile.last.reindex
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

  def profile_followers_p
    Follower.where(profile_follower: self).map{|follower| follower.profile}
  end

  def cont_profile
    followers.where(profile: self).count
  end

  def profiles_followers
    followers.where(profile: self).map{|follower| follower.profile_follower}
  end

  def posts_profile
    posts = []
    followers.where(profile: self).each{|follower| Profile.find(follower.profile_follower_id).posts.each{|post| posts << post}}
    self.posts.each { |post| posts << post }
    posts.sort
  end

  def eliminar(x)
    p = Profile.where(user_name: x).first
    u = p.user
    p.likes.each{|l| l.destroy}
    p.comments.each{|c| c.destroy}
    p.posts.each{|post| post.destroy}
    p.followers.each{|f| f.destroy}
    Follower.where(profile_follower: p).each{|f| f.destroy}
    p.destroy
    u.destroy
  end



end

Profile.where(user_name: "juanpa").first
