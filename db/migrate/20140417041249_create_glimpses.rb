class CreateGlimpses < ActiveRecord::Migration
  def change
    create_table :glimpses do |t|
      t.integer :template_id
      t.string :ip_address
      t.float :latitude
      t.float :longitude
      t.string :location

      t.timestamps
    end
  end
end
