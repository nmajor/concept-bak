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

  def description
    "#{location} - #{created_at.strftime('%b %e, %Y %H:%M')}"
  end
end
