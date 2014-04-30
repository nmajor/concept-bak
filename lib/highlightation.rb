module Highlightation
  extend ActiveSupport::Concern
  included do
    has_many :highlights, as: :highlightable
  end

  def highlight hilites
    hilites.each do |h|
      text.insert(h.end, '</span>')
      text.insert(h.start, '<span class="highlight-'+h.rating+'">')
    end
  end

end
