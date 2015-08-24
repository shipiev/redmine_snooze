namespace :redmine do
  namespace :plugins do
    namespace :snooze do
      desc 'Send deal alarms for today'

      task send_daily_notify: :environment do
        SnoozeMailer.send_daily_notify
      end
    end
  end
end
