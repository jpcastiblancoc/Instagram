require 'rails_helper'

describe " proceso de inicio de sesión", type: :feature do
  before :each do
    @user = create(:profile).user
  end

  it "iniciar sesion" do
    visit '/users/sign_in'
    fill_in 'id_email_session', with: @user.email
    fill_in 'id_password_session', with: @user.password
    click_button 'Iniciar sesión'
    expect(page).to have_content 'Signed in successfully.'
  end
end

