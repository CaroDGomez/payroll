class Wage < ApplicationRecord
  belongs_to :employee


  validates :base_salary, :numericality => { :greater_than_or_equal_to => 0 },
                          presence: :true
  validate :end_date_after_start_date

  def end_date_after_start_date
    return if initial_date.blank?

    if final_date < initial_date
      errors.add(:final_date, "must be after the start date")
    end
  end
end
