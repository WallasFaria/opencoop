class Withdrawal < Operation
  belongs_to :account
  belongs_to :operable, polymorphic: true

  validates :value, :account, :oprable, :presence
  validates :value, numericality: { greater_than: 0 }
  validate :available_account_balance

  def change_value
    value
  end

  private

  def available_account_balance
    errors.add(:value, :insufficient_balance) if value > account.balance
  end
end
