class CreateHighlights < ActiveRecord::Migration
  def change
    create_table :highlights do |t|
      t.integer :highlightable_id
      t.string :highlightable_type
      t.string :highlightable_attr
      t.integer :start
      t.integer :end
      t.integer :length

      t.timestamps
    end
  end
end
