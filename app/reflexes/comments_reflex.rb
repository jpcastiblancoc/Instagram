# frozen_string_literal: true

class CommentsReflex < ApplicationReflex
  def submit
    text = params["text"].to_s
    post = Post.find(params["pts"]["pts_id"].to_i)
    profile = User.find(params["user"]["user_id"].to_i).profile
    unless text.blank?
      Comment.create(text: text, post: post, profile: profile)
    end
  end

  def delete
    Comment.find(element.dataset[:step].to_i).destroy
  end
end
