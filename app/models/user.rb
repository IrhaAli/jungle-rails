class User < ApplicationRecord
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true
  has_secure_password

  def authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    user.authenticate(password)
  end
end
