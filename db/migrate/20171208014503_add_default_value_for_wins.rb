class AddDefaultValueForWins < ActiveRecord::Migration[5.1]
  def change
    change_column :teams, :wins, :integer, default:0
  end
end
