require_dependency 'mailer'

class SnoozeMailer < Mailer
  def daily_notity(created_by, snoozes)
    @snoozes = snoozes

    mail subject: l(:daily_notity, scope: 'snooze_mailer.subjects'), to: created_by.mail
  end

  def self.send_daily_notity
    Snooze.active.open_deals.where('deadline_on >= DATE(?)', Date.today.to_date).to_a.group_by(&:created_by).each do |created_by, snoozes|
      daily_notify(created_by, snoozes).deliver
    end
  end
end