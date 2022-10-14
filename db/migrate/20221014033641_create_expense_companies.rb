class CreateExpenseCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :expense_companies do |t|
      t.string :name
      t.string :type
      t.decimal :percentage
      t.decimal :amount
      t.date :initial_date
      t.date :final_date

      t.timestamps
    end
  end
end
