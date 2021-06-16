class RenamePropertyCodeColumnToRealProperties < ActiveRecord::Migration[5.2]
  def change
    rename_column :real_properties, :property_code, :property_id
  end
end
