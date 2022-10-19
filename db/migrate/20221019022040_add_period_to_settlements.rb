class AddPeriodToSettlements < ActiveRecord::Migration[7.0]
  def change
    add_reference :settlements, :period, null: false, foreign_key: true
  end
end
