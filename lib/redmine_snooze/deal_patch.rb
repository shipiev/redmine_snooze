module RedmineSnooze::DealPatch
  extend ActiveSupport::Concern

  included do
    has_one :snooze
  end
end

