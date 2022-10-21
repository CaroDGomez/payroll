class PeriodController < ApplicationController
  before_action :authorize_request

  def create
    @period = Period.new(period_params)

    if @period.save
      render json: @period, status: :ok
    else
      render json: { errors: @period.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

  def period_params
    params.permit(:initial_date, :final_date)
  end
end
