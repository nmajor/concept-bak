class AddActiveColumnToRtbs < ActiveRecord::Migration
  def change
    add_column :rtbs, :active, :boolean, :default => true
    add_index :rtbs, :active
  end
end
