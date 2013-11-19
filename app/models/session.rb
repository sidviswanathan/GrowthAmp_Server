class Session < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :customer
  belongs_to :user
  has_many :trackings, :dependent => :destroy
  
  def self.create_session_record(params)
    s = Session.new
    s.customer_id           = params[:customer_id]
    s.user_id               = params[:user_id]
    s.start_time            = params[:start_time]
    s.end_time              = params[:end_time]  
    s.session_type          = params[:session_type]
    s.num_invited_contacts  = params[:num_invited_contacts].to_i
    s.save
    return s
  end
end
