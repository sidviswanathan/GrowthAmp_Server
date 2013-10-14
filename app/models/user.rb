class User < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :customer
  has_many :trackings, :dependent => :destroy
end
