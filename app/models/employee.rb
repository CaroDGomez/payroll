class Employee < ApplicationRecord
  belongs_to :company
  has_many :wages
  has_many :other_revenues
  has_many :settlements
  has_many :retention_deductions
  has_many :expense_companies

  has_secure_password

  enum role: %i[employee accountant].freeze

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
end
