class Rtbgroup < ActiveRecord::Base
  belongs_to :template
  has_many :highlights, as: :highlightable
  has_many :rtbs

  def active_rtbs
    rtbs.where(:active => true)
  end
end
