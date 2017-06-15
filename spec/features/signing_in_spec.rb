require "rails_helper"

RSpec.feature "Users can sign in" do
  let!(:user) { User.create( email: Faker::Internet.email, password: 'password', password_confirmation: 'password') }

  scenario "with valid credentials" do
    visit "/"
    click_link "Log in"
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Log in"

    expect(page).to have_content "Signed in successfully."
    expect(page).to have_content "Signed in as #{user.email}"
  end

end
