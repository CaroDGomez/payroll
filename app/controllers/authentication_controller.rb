class AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login

  def login
    @employee = Employee.find_by_email(params[:email])
    if @employee&.authenticate(params[:password])
      @token = JsonWebToken.encode(employee_id: @employee.id)
      @time = Time.now + 24.hours.to_i
      render :login, status: :ok
    else
      render :errors, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
