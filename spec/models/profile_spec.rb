require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe '#new' do
    it 'new Profile' do
      profile = create(:profile)
      expect(profile.user.nil?).to eq(false)
    end
  end
end


describe "Profile", type: :feature do
  it "Redireccionar al show de profile despues de registrarse" do
    visit "/profile/new"
    fill_in 'id_name', with: 'Juan Pablo'
    fill_in 'id_user_name', with: 'JuanP'
    fill_in 'id_date_field', with: "01-01-2000"
    fill_in 'id_email', with: 'juanc95@gmail.com'
    fill_in 'id_password', with: '123456'
    find("input[type='submit']").click
    expect(page).to have_content('JuanP')
  end
end

describe "Profile", type: :feature do
  it "error de registro, correo nulo" do
    visit "/profile/new"
    fill_in 'id_name', with: 'Juan Pablo'
    fill_in 'id_user_name', with: 'JuanP'
    fill_in 'id_date_field', with: Date.new
    fill_in 'id_email', with: nil
    fill_in 'id_password', with: '123456'
    find("input[type='submit']").click
    expect(page).to have_content("can't be blank")
  end
end

describe "Profile", type: :feature do
  it "error de registro, clave invalida" do
    visit "/profile/new"
    fill_in 'id_name', with: 'Juan Pablo'
    fill_in 'id_user_name', with: 'JuanP'
    fill_in 'id_date_field', with: Date.new
    fill_in 'id_email', with: 'juan@gmail.com'
    fill_in 'id_password', with: '12345'
    find("input[type='submit']").click
    expect(page).to have_content("Contraseña no valido")
  end
end
