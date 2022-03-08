class ProfileController < ApplicationController
  @@data = nil

  def index
  end

  def new

    @user = @@data
  end

  def create
    @@data = params if params.has_key?(:name)
    if params.has_key?(:date_birth)
      user1 = User.new(email: @@data[:email], password: @@data[:password])
      profile = Profile.create(name: @@data[:name], user_name: @@data[:user_name], user: user1, date_birth: date_format(params[:date_birth]))
      $user = profile.user
      @@data = nil
      redirect_to post_index_path
     else
       redirect_to profile_new_path
       @user= nil
     end
  end

    def date_format(date_string)
      date_aux = date_string.split("-").map{|s| s.to_i}
      Date.new(date_aux[0], date_aux[1], date_aux[2])
    end

end
