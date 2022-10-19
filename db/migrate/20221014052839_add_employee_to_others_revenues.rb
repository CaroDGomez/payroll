class AddEmployeeToOthersRevenues < ActiveRecord::Migration[7.0]
  def change
    add_reference :other_revenue, :employee, null: false, foreign_key: true
  end
end
