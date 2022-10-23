class CreatePeriodService < ApplicationService
  attr_reader :month, :year

  def initialize(month, year, current_employee)
    @month = month
    @year = year
    @current_employee = current_employee
    @errors = []
  end

  def call
    create_period
  end

  private

  def create_period
    puts @current_employee.role
    if @current_employee.role == 'owner'
      @period = calculate_period_time

      if @period.save
        @period
      else
        @period.errors.full_messages
      end
    else
      "not authorized"
    end

  end

  Couple.select("couples.id as id, couples.game_id as game_id, employees.id as employee_id, employees.name as employee_name").joins(:employees).where(["couples.game_id = :game_id and employees.id = :id", {game_id: selected_year[0].id, id: couple[0].id}])

  def calculate_period_time
    Period.new(  initial_date: Date.new(@year, @month, 1),
                 final_date: Date.new(@year, @month, -1),
                 company_id: @current_employee.company_id
    )
  end
end