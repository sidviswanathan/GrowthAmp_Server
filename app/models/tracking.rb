class Tracking < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :customer
  belongs_to :user
  belongs_to :session
end
