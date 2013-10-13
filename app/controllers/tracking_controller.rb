require 'logger'

class TrackingController < ApplicationController
  
  def index  
  end    
  
  def create
    response_object = ApplicationController.initialize_response_object
    logger.info params
    render :json => response_object.to_json
  end
  
  def show
  end

  def update
  end
  
end
