class Assembly < ApplicationRecord
  enum status: %i[scheduled open_to_proposals open_to_vates closed]

  belongs_to :cooperative
  has_many :proposals
  accepts_nested_attributes_for :proposals

  validates :value_to_split, presence: true, numericality: { greater_than: 0 }
  validates :pre_assembly_date, presence: true
  validates :voting_date, presence: true
end
