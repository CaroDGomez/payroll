class RetentionDeduction < ApplicationRecord
  belongs_to :employee
  belongs_to :period
end
