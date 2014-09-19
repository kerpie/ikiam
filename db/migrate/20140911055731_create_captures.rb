class CreateCaptures < ActiveRecord::Migration
  def change
    create_table :captures do |t|
      t.float :altitude
      t.float :latitude
      t.float :longitude
      t.float :temperature
      t.text :description
      t.float :humidity
      t.text :environment_description
      t.time :time
      t.integer :user_id
      t.integer :season_id
      t.integer :region_id
      t.integer :capture_type_id

      t.timestamps
    end
  end
end
