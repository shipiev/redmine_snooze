class SnoozeMailer < Mailer
  def daily_notity(created_by, snoozes)
    @snoozes = snoozes

    mailer subject: l(:daily_notity, scope: 'snooze_mailer.subjects'), to: created_by.mail
  end
end