class AddPeriodToRetentionDeductions < ActiveRecord::Migration[7.0]
  def change
    add_reference :retention_deductions, :period, null: false, foreign_key: true
  end
end
