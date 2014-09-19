class CreateCaptureTypes < ActiveRecord::Migration
  def change
    create_table :capture_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
