class CreateRtbgroups < ActiveRecord::Migration
  def change
    create_table :rtbgroups do |t|
      t.string :name
      t.integer :template_id

      t.timestamps
    end
  end
end
