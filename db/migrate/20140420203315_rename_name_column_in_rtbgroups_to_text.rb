class RenameNameColumnInRtbgroupsToText < ActiveRecord::Migration
  def change
    rename_column :rtbgroups, :name, :text
  end
end
