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

  scenario "when providing invalid email" do
      visit "/"
      click_link "Sign up now!"
      fill_in "Name", with: "exampleuser"
      fill_in "Email", with: "test@.com"
      fill_in "user_password", with: "Password1"
      fill_in "Password confirmation", with: "Password1"
      click_button "Sign up"
      expect(page).to have_content("invalid")
  end

  scenario "when providing invalid password" do
      visit "/"
      click_link "Sign up now!"
      fill_in "Name", with: "user1"
      fill_in "Email", with: "user1@yahoo.com"
      fill_in "user_password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_button "Sign up"
      expect(page).to have_content("8 characters minimum")
  end

end
