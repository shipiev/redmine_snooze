module RedmineSnooze::NotePatch
  extend ActiveSupport::Concern

  included do
    has_one :snooze
  end

  def to_s
    content
  end
end