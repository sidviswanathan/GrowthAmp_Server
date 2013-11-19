class Session < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :customer
  belongs_to :user
  has_many :trackings, :dependent => :destroy
  
end
