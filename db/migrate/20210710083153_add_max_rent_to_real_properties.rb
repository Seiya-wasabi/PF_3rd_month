class AddMaxRentToRealProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :real_properties, :max_rent, :float
    add_column :real_properties, :min_rent, :float
  end
end
