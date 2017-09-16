# Testing Sign_up with rspec and capibara
require 'rails_helper'

describe "Spec for Sign Up" do
  it "should create new user account" do
  	visit new_user_registration_path #capibara
  	fill_in 'user_email', :with => "user1@yahoo.com"
  	fill_in 'user_password', :with => "Password1"
  	fill_in 'user_password_confirmation', :with => "Password1"
  	click_button 'Sign up'
  	expect(page).to have_content "Welcome! You have signed up successfully."
  end
end
