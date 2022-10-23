class Period < ApplicationRecord
  has_many :settlements
  has_many :retention_deductions
  has_many :other_revenues
  has_many :expense_companies
  belongs_to :company

  validates :initial_date, :final_date, presence: true

end
