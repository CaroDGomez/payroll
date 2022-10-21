class CompanyController < ApplicationController
  before_action :authorize_request, except: :create

  def index
    @companies = Company.all
    
    @current_employee = Employee.find(@decoded[:employee_id])
    puts @current_employee.role
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      render json: @company, status: :created
    else
      render json: { errors: @company.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

  def company_params
    params.permit(:name, :nit)
  end
end
