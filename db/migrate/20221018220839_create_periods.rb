class CreatePeriods < ActiveRecord::Migration[7.0]
  def change
    create_table :periods do |t|
      t.date :initial_date
      t.date :final_date

      t.timestamps
    end
  end
end
