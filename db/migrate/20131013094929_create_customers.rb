class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :app_name
      t.string :app_id
      t.string :secret
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :company
      t.string :hashed_password
      t.string :salt
      t.boolean :valid_customer, :default => true
      t.text  :display_settings
      t.text :other_settings
      t.timestamps
    end
    
    add_index :customers, [:email, :secret]
  end
end
