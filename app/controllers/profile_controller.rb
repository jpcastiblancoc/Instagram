class ProfileController < ApplicationController
  @@data = nil

  def index
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
    @user = @@data
  end

  def create
    @@data = params if params.has_key?(:name)

    if params.has_key?(:date_birth)
      user1 = User.new(email: @@data[:email], password: @@data[:password])
      profile = Profile.create(name: @@data[:name], user_name: @@data[:user_name], user: user1, date_birth: date_format(params[:date_birth]), avatar: nil)
      $user = profile.user
      session[:user_id] = profile.user.id
      @@data = nil
      redirect_to post_index_path
     else
       redirect_to new_profile_path
       @user= nil
     end
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    pp @profile
    @profile.update(profile_params)

    redirect_to profile_path
  end

  private
    def date_format(date_string)
      date_aux = date_string.split("-").map{|s| s.to_i}
      Date.new(date_aux[0], date_aux[1], date_aux[2])
    end

    def profile_params
      params.require(:profile).permit(:name, :user_name, :date_birth, :avatar,)
    end


end
