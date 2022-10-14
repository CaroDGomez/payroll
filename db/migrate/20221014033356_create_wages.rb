class CreateWages < ActiveRecord::Migration[7.0]
  def change
    create_table :wages do |t|
      t.decimal :base_salary
      t.decimal :transport_subsidy
      t.date :initial_date
      t.date :final_date

      t.timestamps
    end
  end
end
