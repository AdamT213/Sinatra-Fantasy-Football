class AddManagerIdToLeagues < ActiveRecord::Migration[5.1]
  def change
    add_column :leagues, :manager_id, :integer
  end
end
