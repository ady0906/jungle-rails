class User < ActiveRecord::Base

  has_secure_password

  validates :password, length: { in: 8..20 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }

    def authenticate_with_credentials(testemail, testpassword)
      @userFound = User.find_by(email: testemail.downcase).try(:authenticate, testpassword)
      if @userFound
        @userFound
      else
        nil
    end

  end

end
