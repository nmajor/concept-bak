class RemoveAttributesFromTemplates < ActiveRecord::Migration
  def change
    remove_column :templates, :name, :string
    remove_column :templates, :desc, :string
    remove_column :templates, :text, :text
  end
end
