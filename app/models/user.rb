class User < ApplicationRecord
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, uniqueness: true
  has_secure_password
end
