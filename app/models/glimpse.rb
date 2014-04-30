class Glimpse < ActiveRecord::Base
  has_many :highlights
  belongs_to :template
  geocoded_by :ip_address do |gl, res|
    response = res[0]
    gl.longitude = response.longitude
    gl.latitude = response.latitude
    gl.location = "#{response.city}, #{response.state}, #{response.country}"
  end
  after_validation :geocode

  def name_highlights
    highlights.where(highlightable_type: 'Name').order(end: :desc)
  end

  def desc_highlights
    highlights.where(highlightable_type: 'Desc').order(end: :desc)
  end

  def body_highlights
    highlights.where(highlightable_type: 'Body').order(end: :desc)
  end

  def rtbgroup_highlights rtbgroup_id
    highlights.where(highlightable_type: 'Rtbgroup').where(highlightable_id: rtbgroup_id).order(end: :desc)
  end

  def rtb_highlights rtb_id
    highlights.where(highlightable_type: 'Rtb').where(highlightable_id: rtb_id).order(end: :desc)
  end

  def description
    "#{location} - #{created_at.strftime('%b %e, %Y %H:%M')}"
  end
end
