class Highlight < ActiveRecord::Base
  belongs_to :highlightable, polymorphic: true
  belongs_to :glimpse
end
