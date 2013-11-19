class User < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :customer
  has_many :trackings, :dependent => :destroy

  def self.create_user_record(params)
    u = User.new
    u.customer_id     = params[:customer_id]
    u.device_id       = params[:device_id]
    u.device_type     = params[:device_type]
    u.device_os       = params[:device_os]  
    u.device_carrier  = params[:device_carrier]
    u.sdk_version     = params[:sdk_version]
    u.device_locale   = params[:device_locale]
    #u.ip_address      = params[:ip_address]
    u.save
    return u
  end
  
  def self.update_user_record(user,params)
    user.device_id       = params[:device_id]
    user.device_type     = params[:device_type]
    user.device_os       = params[:device_os]  
    user.device_carrier  = params[:device_carrier]
    user.sdk_version     = params[:sdk_version]
    user.device_locale   = params[:device_locale]
    #user.ip_address      = params[:ip_address]
    user.save
    return user
  end  
    
end
