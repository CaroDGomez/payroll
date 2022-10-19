class AddEmployeeToWages < ActiveRecord::Migration[7.0]
  def change
    add_reference :wages, :employee, null: false, foreign_key: true
  end
end
