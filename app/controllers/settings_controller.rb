class SettingsController < ApplicationController
  
  def create
    response_object = ApplicationController.initialize_response_object
    response_object[:details] = {:customer_id => 1}
    render :json => response_object.to_json
  end
  
  def show
    response_object = ApplicationController.initialize_response_object
    response_object[:details] = {}
    render :json => response_object.to_json
  end
      
end
