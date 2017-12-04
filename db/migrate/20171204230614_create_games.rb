class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :winning_team_id
      t.string :losing_team_id
    end
  end
end
