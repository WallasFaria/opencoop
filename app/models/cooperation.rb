class Cooperation < ApplicationRecord
  belongs_to :cooperative
  belongs_to :associate
  has_many :transactions

  has_one :account, as: :owner

  validates :share_capital, numericality: { greater_than: 0 }
  validates :cooperative, uniqueness: { scope: :associate }

  after_create :add_account

  def readline?
    true
  end

  private

  def add_account
    create_account(owner: self)
  end
end
