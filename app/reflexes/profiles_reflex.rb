# frozen_string_literal: true

class ProfilesReflex < ApplicationReflex

  def perform(query = "")
    return unless query.size > 2
    @profiles_follow = Profile.search(query).to_a

  end

end
