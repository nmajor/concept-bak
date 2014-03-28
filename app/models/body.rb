class Body < ActiveRecord::Base
  belongs_to :template
  has_many :highlights, as: :highlightable
end
