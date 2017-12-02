class User < ActiveRecord::Base
  has_many :teams
  has_many :leagues, through: :teams
  has_many :players, through: :teams
  has_secure_password
end