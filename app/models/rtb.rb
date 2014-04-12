class Rtb < ActiveRecord::Base
  belongs_to :rtbgroup
  has_many :highlights, as: :highlightable
end
