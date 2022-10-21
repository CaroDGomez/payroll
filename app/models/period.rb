class Period < ApplicationRecord
  has_many :settlements
  has_many :retention_deductions
  has_many :other_revenues
  has_many :expense_companies
  belongs_to :company

  validates :initial_date, :final_date, presence: true
  validate :end_date_after_start_date
  validate :period_days

  private
  def period_days
    if (final_date-initial_date) > 30
      errors.add(:final_date, "the period must have 30 days")
    end
  end

  def end_date_after_start_date
    return if final_date.blank? || initial_date.blank?

    if final_date < initial_date
      errors.add(:final_date, "must be after the start date")
    end
  end
end
