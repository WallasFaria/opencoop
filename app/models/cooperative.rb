class Cooperative < ApplicationRecord
  enum status: %i[project foundation working]

  belongs_to :segment
  belongs_to :founder, class_name: 'Associate'
  has_many :accounts, as: :owner

  after_create :set_default_status, :create_account

  private

  def create_account
    accounts.create(owner: self)
  end

  def set_default_status
    self.status = :project
  end
end
