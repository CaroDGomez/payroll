class WageController < ApplicationController
  before_action :authorize_request

  attr_accessor :minimun_salary, :transport_subsidy

  def create
    @current_employee = Employee.find(@decoded[:employee_id])
    puts @current_employee.role
    @wage = Wage.new(wage_params)
    if @wage.save
      render json: @wage, status: :created
    else
      render json: { errors: @wage.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

  def wage_params
    @minimun_salary = 1000000

    if params[:base_salary] < (@minimun_salary*2)
      @transport_subsidy = 117176
    else
      @transport_subsidy = 0
    end

    # show in json
    # if params[:final_date] == nil
    #
    # end

    parameters = ActionController::Parameters.new(wage: {base_salary: params[:base_salary], transport_subsidy: @transport_subsidy,
                                              initial_date: params[:initial_date], final_date: params[:final_date],
                                              employee_id: params[:employee_id], period_id: params[:period_id]})

    parameters.require(:wage).permit(:base_salary, :transport_subsidy, :initial_date, :final_date, :employee_id, :period_id)
  end
end
