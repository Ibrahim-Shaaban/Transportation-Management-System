class CreateAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :assignments do |t|
      t.references :driver, null: false, foreign_key: true
      t.references :truck, null: false, foreign_key: true
      t.string :truck_name
      t.string :truck_type

      t.timestamps
    end
  end
end
