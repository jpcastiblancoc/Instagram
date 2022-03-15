
class FollowersReflex < ApplicationReflex

  def follow
    data = element.dataset[:step].split (",")
    profile = Profile.find(data[0].to_i)
    profile_follower = Profile.find(data[1].to_i)
    Follower.create(profile: profile, profile_follower: profile_follower)
  end

  def delete
    data = element.dataset[:step].split (",")
    profile = Profile.find(data[0].to_i)
    profile_follower = Profile.find(data[1].to_i)
    Follower.where(profile: profile, profile_follower: profile_follower).last.destroy
  end

end
