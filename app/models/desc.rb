class Desc < ActiveRecord::Base
  include Highlightation

  belongs_to :template
  before_save :sanitize_text

  private
    def sanitize_text
      self.text = Sanitize.clean(self.text)
    end
end
