require_relative '../services/period/create_period_service'

class PeriodController < ApplicationController
  before_action :authorize_request

  def create
    @current_employee = Employee.find(@decoded[:employee_id])
    @period = CreatePeriodService.call(period_params[:month], period_params[:year], @current_employee)

    if @period.is_a?(Period)
      render json: @period, status: :ok
    else
      render json: { errors: @period },
             status: :unprocessable_entity
    end
  end

  private

  def period_params
    params.permit(:month, :year)
  end
end
