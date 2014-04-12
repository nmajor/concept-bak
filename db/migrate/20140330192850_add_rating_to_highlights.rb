class AddRatingToHighlights < ActiveRecord::Migration
  def change
    add_column :highlights, :rating, :string
  end
end
