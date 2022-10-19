class EmployeesController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_employee, except: %i[create index]

  def index
    @employees = Employee.all
    render json: @employees, status: :ok
  end

  def show
    render json: @employee, status: :ok
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      render json: @employee, status: :created
    else
      render json: { errors: @employee.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    unless @employee.update(employee_params)
      render json: { errors: @employee.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @employee.destroy
  end

  private

  def find_employee
    @employee = Employee.find_by_id!(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'Employee not found' }, status: :not_found
  end

  def employee_params
    params.permit(:name, :email, :password, :password_confirmation, :role, :company_id)
  end
end
