require "rails_helper"

RSpec.feature "Signed-in users can sign out" do
  let!(:user) { User.create( name: 'user1', email: 'user1@yahoo.com', password: 'password', password_confirmation: 'password') }

  before do
    login_as(user)
  end

  scenario do
    visit "/"
    click_link "Sign out"
    expect(page).to have_content "Signed out successfully."
  end
end
