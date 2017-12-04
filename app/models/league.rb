class League < ActiveRecord::Base
  has_many :teams
  has_many :users, through: :teams
  has_many :players, through: :teams

#   def standings
#     self.teams.sort_by(record).each do |team|
#       "#{team.name}: #{team.record}"
#     end
#   end
end
