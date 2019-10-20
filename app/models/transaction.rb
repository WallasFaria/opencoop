class Transaction < ApplicationRecord
  belongs_to :cooperation
  delegate :account, to: :cooperation

  validates :description, presence: true
  validates :value, numericality: { greater_than: 0 }

  after_create :create_operation

  private

  def create_operation
    remaining = apply_fees
    account.operations.create(operable: self, value: remaining, type: 'Deposit')
  end

  def apply_fees
    system_value = value * 0.02

    cooperative = cooperation.cooperative
    cooperative_value = value * (cooperative.cost_per_transaction / 100)
    cooperative.account.operations.create(
      operable: self,
      value: cooperative_value,
      type: 'Deposit'
    )
    value - system_value - cooperative_value
  end
end
