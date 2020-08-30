class User < ApplicationRecord
  has_secure_password

  has_many :carts
  validates_presence_of :first_name, :mobile_number, :password_digest
end
