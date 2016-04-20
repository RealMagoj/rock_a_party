class User < ActiveRecord::Base

  has_many :venues

  has_secure_password

  validates :firstname,
    presence: true

  validates :lastname,
    presence: true
  
  validates :email,
    presence: true,
    uniqueness: true,
    confirmation: true

  validates :password,
    length: {in: 6..20}, on: :create

  validates :birthday,
    presence: true

  validates :gender,
    presence: true

end