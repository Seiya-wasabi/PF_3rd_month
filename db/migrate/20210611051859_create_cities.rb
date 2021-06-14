class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.text :city_name
      t.integer :prefecture_id

      t.timestamps
    end
  end
end
