require 'rails_helper'

RSpec.describe User, type: :model do
  let(:base_parms)  { { name:                  'standard1',
                        email:                 'standard1@yahoo.com',
                        role:                  'standard',
                        password:              'Password1',
                        password_confirmation: 'Password1'
                    } }

  let(:user) { User.create!(base_parms) }

  describe "attributes" do
     it "should have name, email, role and password attributes" do
       expect(user).to have_attributes(name: base_parms[:name], email: base_parms[:email], role: base_parms[:role], password: base_parms[:password])
     end
  end

end # Rspec
