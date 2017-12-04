class Game < ActiveRecord::Base
  belongs_to :league
  has_many :teams
  has_many :users, through: :teams
end
