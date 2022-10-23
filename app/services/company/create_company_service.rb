require_relative '../company/application_service'

class CreateCompanyService < ApplicationService
  attr_reader :name, :nit, :current_employee

  def initialize(name, nit, current_employee)
    @name = name
    @nit = nit
    @current_employee = current_employee
  end

  def call
    create_company
  end

  private

  def create_company
    company = Company.new(name: @name, nit: @nit)

    if company.save
      set_user_owner(company.id)
      return company
    else
      return company.errors.messages
    end
  end

  def set_user_owner(id)
    employee = Employee.find_by_id!(@current_employee.id)
    employee.role = "owner"
    employee.company_id = id
    employee.save
  end

end
