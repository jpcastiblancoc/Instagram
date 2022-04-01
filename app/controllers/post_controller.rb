class PostController < ApplicationController

  def index
    if !current_user
      redirect_to "/users/sign_in"
    else
      @posts = current_user.profile.posts_profile.reverse
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
    respond_to do |format|
      if @post.save
        format.html { redirect_to post_index_path, notice: "Post created successfully" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private
    def post_params
      params.require(:post).permit(:description, :avatar)
    end


end
