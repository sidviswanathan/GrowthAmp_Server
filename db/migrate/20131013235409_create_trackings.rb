class CreateTrackings < ActiveRecord::Migration
  def change
    create_table :trackings do |t|
      t.belongs_to :customer
      t.belongs_to :user
      t.belongs_to :session
      t.string :pagekey
      t.string :type
      t.string :client_timestamp
      t.string :tracking_code
      t.text :tracking_info
      t.timestamps
    end
  end
end
