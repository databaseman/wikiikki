require "rails_helper"

RSpec.feature "Users can sign in" do
  let!(:user) { User.create( name: 'user1', email: 'user1@yahoo.com', password: 'Password1', password_confirmation: 'Password1') }

  scenario "with valid credentials" do
    visit "/"
    click_link "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"

    expect(page).to have_content "Signed in successfully."
    expect(page).to have_content "Signed in as #{user.email}"
  end

  scenario "with invalid email" do
    visit "/"
    click_link "Sign in"
    fill_in "Email", with: "user1@.com"
    fill_in "Password", with: user.password
    click_button "Sign in"

    expect(page).to have_content "Invalid Email"
  end

  scenario "with invalid password" do
    visit "/"
    click_link "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Sign in"

    expect(page).to have_content "Invalid Email or password"
  end
end
