require 'rails_helper'

RSpec.describe "Sessions" do

  it "signs user in and out" do
    user = User.create!(name: "newuser", email: "user@yahoo.com", password: "Password1")
    #user.confirm   uncomment this if you need it for email confirmation

    sign_in user
    get authenticated_root_path
    expect(controller.current_user).to eq(user)

    sign_out user
    get authenticated_root_path
    expect(controller.current_user).to be_nil
  end

end
