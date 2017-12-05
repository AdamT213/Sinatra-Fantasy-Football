class AddLossesToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :losses, :integer
  end
end
