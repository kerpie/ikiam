json.array!(@captures) do |capture|
  json.extract! capture, :id, :altitude, :latitude, :longitude, :temperature, :description, :humidity, :environment_description, :time, :user_id, :season_id, :region_id, :capture_type_id
  json.url capture_url(capture, format: :json)
end
