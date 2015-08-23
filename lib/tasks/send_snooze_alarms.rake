namespace :redmine do
  namespace :contacts do
    namespace :snooze do
      desc "Send deal alarms for today."

      task send_alarms: :environment do
        Snooze.active.open_deals.where('deadline >= DATE(?)', Date.today.to_date).to_a.group_by(&:created_by).each do |created_by, snoozes|
          SnoozeMailer.daily_notify(created_by, snoozes).deliver
        end
      end
    end
  end
end
