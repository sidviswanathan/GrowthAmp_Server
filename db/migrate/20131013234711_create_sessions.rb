class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.belongs_to :customer
      t.belongs_to :user
      t.string :start_time
      t.string :end_time
      t.text :invited_contacts
      t.string :invitation_url
      t.integer :invitation_clicks
      t.integer :num_invited_contacts
      t.string :session_type
      t.timestamps
    end
  end
end
