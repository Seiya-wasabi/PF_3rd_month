class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.city_name :string
      t.prefecture_id :integer

      t.timestamps
    end
  end
end
