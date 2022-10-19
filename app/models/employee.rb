class Employee < ApplicationRecord
  belongs_to :company
  
  has_secure_password

  enum role: %i[employee accountant].freeze

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
end
