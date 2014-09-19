class AddImageColumnsToCapture < ActiveRecord::Migration
  
  def self.up
    add_attachment :captures, :image
  end

  def self.down
    remove_attachment :captures, :image
  end

end