class ApplicationController < ActionController::Base



  private
  def current_user
    if session.key?("warden.user.user.key") && session[:user_id].nil?
      session[:user_id] = session["warden.user.user.key"][0]
    end
    @_current_user ||= session[:user_id] && User.find_by(id:session[:user_id] )
  end
end
