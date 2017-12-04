class Team < ActiveRecord::Base
  belongs_to :league
  belongs_to :user
  has_many :players

  def games
    Game.all.each do |game|
      if game.teams.include?(self)
        @@games << game
      end
    end
  end

  def record
    "#{self.wins} - #{self.losses}"
  end

  def wins
    self.games.each do |game|
      if game.winner == self
        @@wins << game
      end
    end
  end

  def losses
    self.games.each do |game|
      if game.winner != self && !game.draw
        @@losses << game
      end
    end
  end
end
