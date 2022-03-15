# frozen_string_literal: true

class LikesReflex < ApplicationReflex

  def increment_like
    data = element.dataset[:step].split (",")
    post = Post.find(data[0].to_i)
    user = User.find(data[1].to_i)
    Like.create(post: post, profile: user.profile)
  end

  def decrement_like
    data = element.dataset[:step].split (",")
    post = Post.find(data[0].to_i)
    user = User.find(data[1].to_i)
    Like.where(post: post, profile: user.profile).last.destroy
  end


end
