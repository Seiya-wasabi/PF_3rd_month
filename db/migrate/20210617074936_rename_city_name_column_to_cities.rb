class RenameCityNameColumnToCities < ActiveRecord::Migration[5.2]
  def change
    rename_column :cities, :city_name, :name
  end
end
