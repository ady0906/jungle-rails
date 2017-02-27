class User < ActiveRecord::Base

  has_secure_password

  validates :password, length: { in: 8..20 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  def self.authenticate_with_credentials(email, password)
    # use create method from sessions_controller and pass in params
    user = User.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      user
    else
      raise "Sorry, we could not log you in!"
    end
  end
end
