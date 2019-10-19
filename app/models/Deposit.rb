class Deposit < Operation
  belongs_to :account
  belongs_to :operable, polymorphic: true

  validates :value, :account, :operable, presence: true
  validates :value, numericality: { greater_than: 0 }

  def change_value
    -1 * value
  end
end
