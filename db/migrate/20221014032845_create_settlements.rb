class CreateSettlements < ActiveRecord::Migration[7.0]
  def change
    create_table :settlements do |t|
      t.decimal :total_employee
      t.decimal :total_company
      t.date :initial_date
      t.date :final_date

      t.timestamps
    end
  end
end
