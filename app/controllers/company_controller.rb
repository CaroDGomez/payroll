require_relative '../services/company/create_company_service'

class CompanyController < ApplicationController
  before_action :authorize_request

  def index
    @companies = Company.all
  end

  def create
    @current_employee = Employee.find(@decoded[:employee_id])
    @company = CreateCompanyService.call(company_params[:name], company_params[:nit], @current_employee)

    if @company.is_a?(Company)
      render :create, status: :created
    else
      render :errors, status: :unprocessable_entity
    end
  end

  private

  def company_params
    params.permit(:name, :nit)
  end
end
