class Cooperative < ApplicationRecord
  enum status: %i[project foundation working]
  attr_readonly :share_capital

  belongs_to :segment
  belongs_to :founder, class_name: 'Associate'
  has_many :cooperations, after_add: :update_share_capital
  has_one :account, as: :owner

  validates :description,
            :development_time_in_days,
            :share_capital,
            :cost_per_transaction,
            :value_minimum_to_start,
            presence: true

  before_create :set_default_status
  after_create :add_account
  after_update :check_status

  private

  def check_status
    update(status: :foundation) if account >= value_minimum_to_start
  end

  def update_share_capital(cooperation)
    self.share_capital += cooperation.share_capital
    save
  end

  def add_account
    create_account(owner: self)
  end

  def set_default_status
    self.status = :project
  end
end
