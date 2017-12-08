class AddDefaultValueForLosses < ActiveRecord::Migration[5.1]
  def change
    change_column :teams, :losses, :integer, default:0
  end
end
