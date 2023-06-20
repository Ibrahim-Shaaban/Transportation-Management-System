class AddComposedIndexToAssignments < ActiveRecord::Migration[7.0]
  def change
    add_index :assignments, [:driver_id, :truck_id], unique: true
  end
end
