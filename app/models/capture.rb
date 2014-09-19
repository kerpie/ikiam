class Capture < ActiveRecord::Base

	belongs_to :user
	belongs_to :season
	belongs_to :region
	belongs_to :capture_type

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.jpg"
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	def self.find_by_word(text)
		by_descriptions = []
		by_environment_descriptions = []
		text.split.each do |new_text|
			by_descriptions += Capture.where("description like ?", "%#{new_text.strip}%").to_a
			by_environment_descriptions += Capture.where("environment_description like ?", "%#{new_text.strip}%").to_a
		end
		result = by_descriptions | by_environment_descriptions
		result
	end

	def self.advanced_search(latitude, longitude, altitude, temperature, humidity, season, capture_type)
		if(latitude.nil? || latitude.empty? || longitude.nil? || longitude.empty? || altitude.nil? || altitude.empty? || temperature.nil? || temperature.empty? || humidity.nil? || humidity.empty?)
			return nil
		else
			tmp = get_mins_and_max(latitude)
			min_lat = tmp.first
			max_lat = tmp.last
			
			tmp = get_mins_and_max(longitude)			
			min_lng = tmp.first
			max_lng = tmp.last

			tmp = get_mins_and_max(altitude)
			min_alt = tmp.first
			max_alt = tmp.last

			tmp = get_mins_and_max(temperature)
			min_tmp = tmp.first
			max_tmp = tmp.last

			tmp = get_mins_and_max(humidity)
			min_hum = tmp.first
			max_hum = tmp.last

			result = nil
			
			if season.empty?
				if capture_type.empty?
					result = Capture.where("latitude >= ? AND latitude <= ? AND longitude >= ? AND longitude <= ? AND altitude >= ? AND altitude <= ? AND temperature >= ? AND temperature <= ? AND humidity >= ? AND humidity <= ?", min_lat, max_lat, min_lng, max_lng, min_alt, max_alt, min_tmp, max_tmp, min_hum, max_hum)
					puts "season true and capture_type true" 
				else
					result = Capture.where("latitude >= ? AND latitude <= ? AND longitude >= ? AND longitude <= ? AND altitude >= ? AND altitude <= ? AND temperature >= ? AND temperature <= ? AND humidity >= ? AND humidity <= ? AND capture_type_id = ?", min_lat, max_lat, min_lng, max_lng, min_alt, max_alt, min_tmp, max_tmp, min_hum, max_hum, capture_type_id.to_i)
					puts "season true and capture_type false"
				end
			else
				if capture_type.empty?
					result = Capture.where("latitude >= ? AND latitude <= ? AND longitude >= ? AND longitude <= ? AND altitude >= ? AND altitude <= ? AND temperature >= ? AND temperature <= ? AND humidity >= ? AND humidity <= ? AND season_id = ?", min_lat, max_lat, min_lng, max_lng, min_alt, max_alt, min_tmp, max_tmp, min_hum, max_hum, season.to_i)
					puts "season false and capture_type true"
				else
					result = Capture.where("latitude >= ? AND latitude <= ? AND longitude >= ? AND longitude <= ? AND altitude >= ? AND altitude <= ? AND temperature >= ? AND temperature <= ? AND humidity >= ? AND humidity <= ? AND season_id = ? AND capture_type_id = ?", min_lat, max_lat, min_lng, max_lng, min_alt, max_alt, min_tmp, max_tmp, min_hum, max_hum, season.to_i, capture_type.to_i)
					puts "season false and capture_type false"
				end
			end	

			result
		end
	end

	def self.get_mins_and_max(value)
		values = value.split(":") - [""]
		min_val = 0
		max_val = 0
		if(values.count > 1)
			min_val = values.first.to_f
			max_val = values.last.to_f
		else
			tmp = values.last.to_f
			if tmp > 0
				min_val = 0.to_f
				max_val = tmp
			else
				min_val = tmp 
				max_val = 0
			end
		end
		puts "min_val: #{min_val}"
		puts "max_val: #{max_val}"
		[min_val, max_val]
	end

end