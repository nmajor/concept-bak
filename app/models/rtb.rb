class Rtb < ActiveRecord::Base
  include Highlightation

  belongs_to :rtbgroup
  before_save :sanitize_text

  private
    def sanitize_text
      self.text = Sanitize.clean(self.text)
    end
end
