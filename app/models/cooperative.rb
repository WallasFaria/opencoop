class Cooperative < ApplicationRecord
  enum status: %i[project foundation working]

  belongs_to :segment
  belongs_to :founder, class_name: 'Associate'

  before_create :set_default_status

  private

  def set_default_status
    self.status = :project
  end
end
