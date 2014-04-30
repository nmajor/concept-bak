class Name < ActiveRecord::Base
  include Highlightation

  belongs_to :template
end
