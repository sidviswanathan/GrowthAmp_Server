require 'logger'

class TrackingController < ApplicationController
  
  skip_before_filter :verify_authenticity_token
  before_filter :authenticate
  
  def authenticate
    @authenticated_customer = Customer.authenticate_api_request(params[:secret])
    if !@authenticated_customer
      response_object = ApplicationController.initialize_response_object
      response_object[:status] = "failure"
      response_object[:message] = "You are not authenticated wto make this request"
      render :json => response_object.to_json
    end
  end  
  
  def create
    response_object = ApplicationController.initialize_response_object
    logger.info params
    Tracking.create_tracking_records(params)
    render :json => response_object.to_json
  end

end
