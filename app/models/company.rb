class Company < ApplicationRecord
  has_many :employees
  has_many :expense_companies
  has_many :periods
  has_many :settlements

  validates :name, presence: true, uniqueness: true
  validates :nit, presence: true, uniqueness: true
end
