class CreateRetentionDeductions < ActiveRecord::Migration[7.0]
  def change
    create_table :retention_deductions do |t|
      t.string :name
      t.decimal :amount
      t.date :initial_date
      t.date :final_date

      t.timestamps
    end
  end
end
