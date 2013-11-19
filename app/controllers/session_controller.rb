class SessionController < ApplicationController

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
  
  # POST /session/
  def create
    response_object = ApplicationController.initialize_response_object
    response_object[:details] = {:session_id => rand(1..1000)}
    render :json => response_object.to_json
  end

end
