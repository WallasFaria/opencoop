class Associate < ApplicationRecord
  has_one :user
  has_one :address, as: :addressable
  has_many :cooperatives, foreign_key: :founder_id

  has_many :accounts, through: :cooperatives

  accepts_nested_attributes_for :address
end
