class Highlight < ActiveRecord::Base
  belongs_to :highlightable, polymorphic: true
end
