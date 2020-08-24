class User < ApplicationRecord
  has_secure_password
  validates_presence_of :first_name, :mobile_number, :password_digest
end
