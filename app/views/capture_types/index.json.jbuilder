json.array!(@capture_types) do |capture_type|
  json.extract! capture_type, :id, :name
  json.url capture_type_url(capture_type, format: :json)
end
