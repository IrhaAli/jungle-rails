class User < ApplicationRecord
  before_save do
    self.email = email.downcase
  end

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true
  validates :password, :password_confirmation, presence: true, length: { minimum: 8 }
  has_secure_password

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.downcase.strip)
    user ? user.authenticate(password) : false
  end
end
