class AddGlimpseIdToHighlights < ActiveRecord::Migration
  def change
    add_column :highlights, :glimpse_id, :integer
    add_index :highlights, :glimpse_id
  end
end
