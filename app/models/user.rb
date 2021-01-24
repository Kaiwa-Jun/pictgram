class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: 
  
  has_secure_password
end
