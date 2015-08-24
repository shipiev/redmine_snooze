require_dependency 'mailer'

class SnoozeMailer < Mailer
  def daily_notify(created_by, snoozes)
    @snoozes = snoozes

    mail subject: l(:daily_notify, scope: 'snooze_mailer.subjects', count: @snoozes.count), to: created_by.mail
  end

  def send_daily_notify
    Snooze.active.open_deals.where('deadline_on >= DATE(?)', Date.today.to_date).to_a.group_by(&:created_by).each do |created_by, snoozes|
      SnoozeMailer.daily_notify(created_by, snoozes).deliver
    end
  end
end