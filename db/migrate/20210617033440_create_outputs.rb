class CreateOutputs < ActiveRecord::Migration[5.2]
  def change
    create_table :outputs do |t|
      t.integer :property_id
      t.integer :area_id
      t.integer :average_rent

      t.timestamps
    end
  end
end
