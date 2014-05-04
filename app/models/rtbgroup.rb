class Rtbgroup < ActiveRecord::Base
  include Highlightation
  belongs_to :template
  has_many :rtbs
  before_save :sanitize_text

  def active_rtbs
    rtbs.where(:active => true)
  end

  def name
    text
  end


  private
    def sanitize_text
      self.text = Sanitize.clean(self.text)
    end
end
