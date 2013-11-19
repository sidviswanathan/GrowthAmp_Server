class UserController < ApplicationController
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
  
  # POST /user/
  def create
    response_object = ApplicationController.initialize_response_object
    user = User.create_user_record(params)
    response_object[:details] = {:user_id => user.id}
    render :json => response_object.to_json
  end
  
  # PUT /user/:user_id
  def update
    response_object = ApplicationController.initialize_response_object
    user = User.find_by_id(params[:id])
    if user
      update_user = User.update_user_record(user,params)
      response_object[:details] = {:user_id => user.id}
    else
      response_object[:status] = "failure"
      response_object[:message] = "This is not a valid user id"        
    end  
    render :json => response_object.to_json
  end
end