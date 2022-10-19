class AddEmployeeToSettlements < ActiveRecord::Migration[7.0]
  def change
    add_reference :settlements, :employee, null: false, foreign_key: true
  end
end
