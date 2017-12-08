class Team < ActiveRecord::Base
  belongs_to :league
  belongs_to :user
  has_many :players
  has_many :games

  def win
    self.wins += 1
    self.save
  end

  def lose
    self.losses += 1
    self.save
  end
 end
