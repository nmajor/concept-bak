class CreateBodies < ActiveRecord::Migration
  def change
    create_table :bodies do |t|
      t.text :text

      t.timestamps
    end
  end
end
