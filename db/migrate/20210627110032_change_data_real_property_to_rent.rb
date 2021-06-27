class ChangeDataRealPropertyToRent < ActiveRecord::Migration[5.2]
  def change
    change_column :real_properties, :rent, :float
  end
end
