class Rtb < ActiveRecord::Base
  include Highlightation

  belongs_to :rtbgroup
end
