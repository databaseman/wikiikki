require "rails_helper"

RSpec.feature "Users can sign up" do

  scenario "when providing valid details" do
    visit "/"
    click_link "Sign up now!"
    fill_in "Name", with: "user1"
    fill_in "Email", with: "user1@yahoo.com"
    fill_in "user_password", with: "Password1"
    fill_in "Password confirmation", with: "Password1"
    click_button "Sign up"
    expect(page).to have_content("You have signed up successfully.")
  end

  
end
