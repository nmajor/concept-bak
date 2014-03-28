class CreateNames < ActiveRecord::Migration
  def change
    create_table :names do |t|
      t.string :text

      t.timestamps
    end
  end
end
