class CreateOthersRevenues < ActiveRecord::Migration[7.0]
  def change
    create_table :other_revenue do |t|
      t.string :name
      t.string :type
      t.decimal :amount
      t.date :initial_date
      t.date :final_date

      t.timestamps
    end
  end
end
