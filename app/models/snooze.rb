class Snooze < ActiveRecord::Base
  belongs_to :note
  belongs_to :deal
  belongs_to :created_by, class_name: 'User'

  accepts_nested_attributes_for :note

  attr_accessible :note_attributes, :deal_id, :deal, :deadline_on

  delegate :type_id, to: :note

  before_create :prepend_create
  after_create  :reactive

  scope :active, -> (query = true) do
    where active: query
  end

  scope :open_deals, -> do
    joins(deal: :status).where(deal_statuses: {status_type: ::DealStatus::OPEN_STATUS})
  end

private

  def prepend_create
    self.active = true
    self.created_by = User.current
    self.note.author = User.current if self.note.present?
  end

  def reactive
    self.class.where(deal_id: self.deal_id, created_by_id: self.created_by_id, active: true).where('id <> ?', id).update_all(active: false)
  end

end
