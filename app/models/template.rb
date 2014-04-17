class Template < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :rtbgroups
  has_many :glimpses
  has_one :name
  has_one :desc
  has_one :body

  accepts_nested_attributes_for :name, :desc, :body

  def name_text
    name.text
  end

  def desc_text
    desc.text
  end

  def body_text
    body.text
  end
end
