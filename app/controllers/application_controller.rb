class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def self.initialize_response_object    
    response_object              = Hash.new
    response_object[:status]     = "success" 
    response_object[:details]    = Hash.new
    return response_object
  end
  
end
