class CreateRtbs < ActiveRecord::Migration
  def change
    create_table :rtbs do |t|
      t.string :text
      t.integer :rtbgroup_id

      t.timestamps
    end
  end
end
