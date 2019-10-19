class Cooperation < ApplicationRecord
  belongs_to :cooperative
  belongs_to :associate

  has_one :account, as: :owner

  validates :share_capital, numericality: { greater_than: 0 }

  def readline?
    true
  end
end
