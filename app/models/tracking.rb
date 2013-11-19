class Tracking < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :customer
  belongs_to :user
  belongs_to :session
  
  def self.create_tracking_records(params)
  end  
  
  def self.store_tracking_data(params)
    # Loop throguh every tracking data and store each one in table 
    if params[:page_keys]
      page_keys_data = JSON.parse(params[:page_keys])
      if page_keys_data
        if page_keys_data.class == Array
          page_keys_data.each do |page_key|
            #Create a Tracking record
          end  
        end   
      end
    end
    
    # t = Tracking.new
    # t.customer_id       = params[:customer_id] if params[:customer_id] 
    # t.user_id           = params[:user_id] if params[:user_id] 
    # t.session_id        = params[:session_id] if params[:session_id]
    # t.page_key          = page_key["page_key_name"]  
    # t.type              = page_key["type"]
    # t.client_timestamp  = page_key["client_timestamp"]
    # t.tracking_code     = page_key["tracking_code"]
    # t.tracking_info     = page_key["tracking_info"] 
    # t.save      
    
  end
  
end

