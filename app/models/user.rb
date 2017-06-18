class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :secure_validatable

  #validates :name,  presence: true, length: { in: 1..50 }
  #validates :email,  presence: true, uniqueness: true, length: { in: 5..150 },
  #          :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }
  #validates :password,  presence: true, length: { in: 8..128 }

  enum role: [:standard, :premium, :admin]
	# before_save { self.role ||= :standard }  already set at db level

end
