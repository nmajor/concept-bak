class Rtbgroup < ActiveRecord::Base
  include Highlightation
  belongs_to :template
  has_many :rtbs

  def active_rtbs
    rtbs.where(:active => true)
  end

  def name
    text
  end
end
