class Transaction < ApplicationRecord
  belongs_to :cooperation
  delegate :account, to: :cooperation

  validates :description, presence: true
  validates :value, numericality: { greater_than: 0 }

  after_create :create_operation

  private

  def create_operation
    account.operations.create(operable: self, value: value, type: 'Withdrawal')
  end
end
