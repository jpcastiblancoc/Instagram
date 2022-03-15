class Follower < ApplicationRecord
  belongs_to :profile
  belongs_to :profile_follower, class_name: "Profile"

end
