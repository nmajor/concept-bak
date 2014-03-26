json.array!(@templates) do |template|
  json.extract! template, :id, :name, :desc, :image, :text
  json.url template_url(template, format: :json)
end
