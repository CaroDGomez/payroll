class AddEmployeeToExpenseCompany < ActiveRecord::Migration[7.0]
  def change
    add_reference :expense_companies, :employee, null: false, foreign_key: true
  end
end
