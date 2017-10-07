class User < ApplicationRecord
  validates_uniqueness_of :username, presence: true
  validates :password, confirmation: true, on: :create
  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  has_secure_password

  has_many :links, dependent: :delete_all

end
