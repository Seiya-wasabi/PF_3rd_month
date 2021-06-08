class CreateRealProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :real_properties do |t|
      t.integer :property_code
      t.integer :rent
      
      t.timestamps
    end
  end
end
