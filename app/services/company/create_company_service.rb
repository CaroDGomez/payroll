class CreateCompanyService < ApplicationService
  attr_reader :name, :nit

  def initialize(name, nit)
    @name = name
    @nit = nit
    @errors = []
  end

  def call
    create_company
  end

  private

  def create_company
    @company = Company.new
    @company.assign_attributes(name: @name, nit: @nit)

    if @company.save
      render json: @company, status: :created
    else
      render json: { errors: @company.errors.full_messages },
             status: :unprocessable_entity
    end
  end

end
