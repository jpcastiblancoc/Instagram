# frozen_string_literal: true

class ProfilesReflex < ApplicationReflex

  def perform(query = "")
    return unless query.size > 1
    profile = Profile.arel_table
    @profiles_follow = Profile.where(profile[:name].matches("#{query}%"))
  end

end
