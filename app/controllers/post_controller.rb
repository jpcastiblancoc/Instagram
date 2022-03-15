class PostController < ApplicationController

  def index
    if !current_user
      redirect_to "/users/sign_in"
    else
      @posts = Post.all
      @profiles = current_user.profile.to_follows
    end
  end

  def new
    @post = Post.new
  end
  def show
    @profile = Profile.find(params[:id])
    redirect_to "/profile/show"
  end

  def create
    @post = Post.new(post_params)
    @post.profile = current_user.profile
    @post.save



    redirect_to post_index_path
  end

  private
    def post_params
      params.require(:post).permit(:description, :avatar)
    end


end
