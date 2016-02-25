json.array!(@templates) do |template|
  json.extract! template, :id, :title, :description, :parent_id
  json.url template_url(template, format: :json)
end
