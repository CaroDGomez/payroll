class Settlement < ApplicationRecord
  belongs_to :company
  belongs_to :employee
  belongs_to :period


end
