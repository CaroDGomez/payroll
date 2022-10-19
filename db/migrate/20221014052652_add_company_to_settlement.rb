class AddCompanyToSettlement < ActiveRecord::Migration[7.0]
  def change
    add_reference :settlements, :company, null: false, foreign_key: true
  end
end
