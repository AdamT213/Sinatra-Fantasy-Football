class AddWinsToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :wins, :integer
  end
end
