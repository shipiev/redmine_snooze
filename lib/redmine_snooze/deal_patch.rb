module RedmineSnooze::DealPatch
  extend ActiveSupport::Concern

  included do
    has_one :snooze
  end

  def to_s
    name
  end
end

