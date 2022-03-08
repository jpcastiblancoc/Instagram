class HomeController < ApplicationController
  def index
    # redirect_to "/users/sign_in" unless current_user
  end

  def new

  end

  def create
    email = params[:email]
    clave = params[:password]
    nombre = params[:nombre]
    usuario = params[:usuario]

    @user = User.new(email: email, password: clave)
    Profile.create(name: nombre, username: usuario, user: user)

    p "____________________________________"
    p email
    p clave
    p nombre
    p usuario


  end

  private
  def person_params
    params.require(:person).permit(:nombre, :edad)
  end
end
