class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.belongs_to :customer
      t.string :device_id
      t.string :device_type
      t.string :device_os
      t.string :device_carrier 
      t.string :sdk_version
      t.string :device_locale
      t.text :contact_info      
      t.timestamps
    end
  end
end


