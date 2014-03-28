class AddTextColumnToHighlights < ActiveRecord::Migration
  def change
    add_column :highlights, :text, :text
  end
end
