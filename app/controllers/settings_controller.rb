require 'logger'

class SettingsController < ApplicationController
  
  skip_before_filter :verify_authenticity_token
  before_filter :authenticated
  
  def authenticated
    @authenticated_customer = Customer.authenticate_api_request(params[:secret])
    if !@authenticated_customer
      response_object = ApplicationController.initialize_response_object
      response_object[:status] = "failure"
      response_object[:message] = "You are not authenticated wto make this request"
      render :json => response_object.to_json
    end
  end  
  
  # POST /settings/
  def create
    response_object = ApplicationController.initialize_response_object
    response_object[:details] = {:customer_id => 1}
    render :json => response_object.to_json
  end
  
  # GET /settings/:customer_id
  def show
    response_object = ApplicationController.initialize_response_object
    customer = Customer.find_by_id(params[:id])
    if customer
      response_object[:details] = {:customer_id => customer.id}
    else
      response_object[:status] = "failure"
      response_object[:message] = "This is not a valid customer id"        
    end  
    render :json => response_object.to_json
  end
      
end
