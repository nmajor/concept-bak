json.extract! @template, :id, :name_text, :desc_text, :image, :image_url, :body_text, :created_at, :updated_at
json.rtbgroups @template.rtbgroups do |group|
  json.(group, :id, :name, :created_at, :updated_at)
  json.rtbs group.active_rtbs do |rtb|
    json.(rtb, :id, :text, :created_at, :updated_at)
  end
end