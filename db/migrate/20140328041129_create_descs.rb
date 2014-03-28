class CreateDescs < ActiveRecord::Migration
  def change
    create_table :descs do |t|
      t.string :text

      t.timestamps
    end
  end
end
