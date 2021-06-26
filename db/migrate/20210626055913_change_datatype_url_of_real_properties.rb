class ChangeDatatypeUrlOfRealProperties < ActiveRecord::Migration[5.2]
  def change
    change_column :real_properties, :url, :text
  end
end
