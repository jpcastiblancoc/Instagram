class PostController < ApplicationController

  def index
    if $user.nil? && !current_user
      redirect_to "/users/sign_in"
    end

  end

  def new
    post = Post.new
  end

  def create
  end


end
