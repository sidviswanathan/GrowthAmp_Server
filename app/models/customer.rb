class Customer < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :users, :dependent => :destroy
  has_many :sessions, :dependent => :destroy
  has_many :trackings, :dependent => :destroy
  
  def self.authenticate_api_request(secret)
    c = Customer.find_by_secret(secret)
    if c 
      return true 
    else 
      return false 
    end
  end  
  
end  
        