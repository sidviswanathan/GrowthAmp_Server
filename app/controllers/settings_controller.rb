require 'logger'

class SettingsController < ApplicationController
  
  skip_before_filter :verify_authenticity_token
  before_filter :authenticated
  
  def authenticated
    @authenticted_customer = Customer.authenticate_api_request(params[:secret])
    return @authenticted_customer
  end  
  
  # POST /settings/
  def create
    response_object = ApplicationController.initialize_response_object
    if @authenticted_customer
      response_object[:details] = {:customer_id => @authenticted_customer.id}
    else
      response_object[:status] = "failure"
      response_object[:message] = "You are not authenticated to make this request"
    end
    render :json => response_object.to_json
  end
  
  # GET /settings/:customer_id
  def show
    response_object = ApplicationController.initialize_response_object
    response_object[:details] = {}
    if @authenticted_customer
      response_object[:details] = {:customer_id => @authenticted_customer.id}
    else
      response_object[:status] = "failure"
      response_object[:message] = "You are not authenticated to make this request"
    end
    render :json => response_object.to_json
  end
      
end
