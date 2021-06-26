class RenamePropertyIdColumnToRealProperties < ActiveRecord::Migration[5.2]
  def change
    rename_column :real_properties, :property_id, :url
  end
end
