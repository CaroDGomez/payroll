class CreateContracts < ActiveRecord::Migration[7.0]
  def change
    create_table :contracts do |t|
      t.string :contract_type
      t.date :initial_date
      t.date :final_date

      t.timestamps
    end
  end
end
