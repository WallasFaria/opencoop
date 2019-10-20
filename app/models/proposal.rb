class Proposal < ApplicationRecord
  belongs_to :assembly

  validates :owner_name, :optionl_1_name, :optionl_2_name,
            :presence => true
  validates :optionl_1_percent, :optionl_2_percent,
            :numericality => { greater_than: 0, less_than_or_equal_to: 100 }
end
