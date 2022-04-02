class HomeController < ApplicationController
  def index
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
  end

  private
  def person_params
    params.require(:person).permit(:nombre, :edad)
  end
end
