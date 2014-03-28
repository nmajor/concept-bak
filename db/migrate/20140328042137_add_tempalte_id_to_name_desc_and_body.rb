class AddTempalteIdToNameDescAndBody < ActiveRecord::Migration
  def change
    add_column :names, :template_id, :integer
    add_column :descs, :template_id, :integer
    add_column :bodies, :template_id, :integer
  end
end
