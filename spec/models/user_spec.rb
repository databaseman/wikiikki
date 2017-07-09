# Most of User testing is already done via Devise.
# We add stuffs here for testing extra attributes: name, role
# Password: 8-128 char long; required; Password must contain big, small letters and digits
# email: 5-150 char long; required; uniqueness; @; existing (real) domain
# name: 1-50 char long; required
# role: required; in ['standard', 'premium', 'admin']
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_base_parms)  { { name:                  'standard1',
                              email:                 'standard1@yahoo.com',
                              role:                  'standard',
                              password:              'Password1',
                              password_confirmation: 'Password1'
                    } }

  let(:invalid_base_parms)  { { name:                  '',
                                email:                 'd@a.com',
                                role:                  'something',
                                password:              'password',
                                password_confirmation: 'password'
                    } }

  let(:user) { User.create!(valid_base_parms) }
  describe "attributes" do
     it "should have name, valid email, valid role and valid password attributes" do
       expect(user).to have_attributes(name: valid_base_parms[:name], email: valid_base_parms[:email],
                                       role: valid_base_parms[:role], password: valid_base_parms[:password])
     end
  end

  describe "invalid user" do
    invalid_user=User.new

    it "invalid name" do
      invalid_user.name=invalid_base_parms[:name]
      expect(invalid_user).to_not be_valid
    end

  end

end # Rspec
