class User < ActiveRecord::Base
  has_many :teams
  has_many :leagues, through: :teams
  has_many :players, through: :teams
  has_many :games, through: :teams
  has_secure_password

  def slug
    self.username.gsub(" ", '-').downcase
  end

  def self.find_by_slug(slug)
    self.all.find do |username|
      username.slug == slug
    end
  end
end
