class Account < ApplicationRecord
  belongs_to :owner, polymorphic: true
  has_many :operations, after_add: :update_balance

  def only_read?
    true
  end

  protected

  def update_balance(operation)
    self.balance = balance + operation.change_value
    save
  end
end
