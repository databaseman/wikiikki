class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :secure_validatable

# Devise already does its own validation.
# These are for new attributes like name and role
  validates :name,  presence: true, length: { in: 1..50 }
  #validates :role,  presence: true   #role will default to standard to start with. no need to enter
  enum role: [:standard, :premium, :admin]
  validates :password, presence: true, length: { minimum: 8 }, allow_blank: true #blank for when not changing password
  #validates_inclusion_of :role, :in => [ standard, premium, admin ]

#  Already done via devise :secure_validatable
#  validates :email,  presence: true, uniqueness: true, length: { in: 5..150 },
#            :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }
#  validates :password,  presence: true, length: { in: 8..128 }
#  validate :password_complexity
#  def password_complexity
#      if password.present? and not password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)./)
#        errors.add :password, "must include at least one lowercase letter, one uppercase letter, and one digit"
#      end
#  end
# before_save { self.role ||= :standard }  already set at db level
  before_save { self.email = email.downcase if email.present? }

end
