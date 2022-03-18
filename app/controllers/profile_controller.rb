class ProfileController < ApplicationController


  def index
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
    @profile.build_user
  end

  def create
    @profile = Profile.new(profile_params)
    respond_to do |format|
      if @profile.save
        session[:user_id] = @profile.user.id
        format.html { redirect_to profile_url(@profile), notice: "Prueba was successfully created." }
        # redirect_to post_index_path
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end


  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    @profile.update(profile_params)

    redirect_to profile_path
  end

  private
    def date_format(date_string)
      date_aux = date_string.split("-").map{|s| s.to_i}
      Date.new(date_aux[0], date_aux[1], date_aux[2])
    end

    def profile_params
      params.require(:profile).permit(
        :name, :user_name, :date_birth, :avatar,
        user_attributes: [:email, :password])
    end


end
