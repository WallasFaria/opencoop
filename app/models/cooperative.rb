class Cooperative < ApplicationRecord
  enum status: %i[project foundation working]

  belongs_to :segment
  belongs_to :founder, class_name: 'Associate'
  has_many :accounts, as: :owner

  before_create :handler_video_url
  after_create :set_default_status, :create_account

  private

  def create_account
    accounts.create(owner: self)
  end

  def set_default_status
    self.status = :project
  end

  def handler_video_url
    utr_template = 'https://www.youtube.com/embed/:id?autoplay=1'
    match_id = video_url.match(/v=([a-zA-Z0-9_]+)/) if video_url
    self.video_url = utr_template.sub(':id', match_id[1]) if match_id
  end
end
