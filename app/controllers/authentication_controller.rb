class AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login

  def login
    @employee = Employee.find_by_email(params[:email])
    if @employee&.authenticate(params[:password])
      token = JsonWebToken.encode(employee_id: @employee.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     employeename: @employee.name }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
