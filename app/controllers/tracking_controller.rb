require 'logger'

class TrackingController < ApplicationController
  
  def initialize_response_object    
    response_object              = Hash.new
    response_object[:status]     = "success" 
    response_object[:details]    = ""
    return response_object
  end
  
  def index
  end    
  
  def create
    response_object = initialize_response_object
    render :json => response_object.to_json
  end
  
  def show
  end

  def update
  end
  
end
