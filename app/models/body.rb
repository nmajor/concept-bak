class Body < ActiveRecord::Base
  belongs_to :template
  has_many :highlights, as: :highlightable

  def highlight hilites
    hilites.each do |h|
      text.insert(h.end, '</span>')
      text.insert(h.start, '<span class="highlight-'+h.rating+'">')
    end
  end

end
