namespace :redmine do
  namespace :contacts do
    namespace :snooze do

      desc "Send deal alarms for today."

      task :send_alarms => :environment do
        deal_ids = Snooze.where(next_alarm: Date.today + 3.days).select(:deal_id)
        deals = Deal.find(deal_ids)
        
      end

  end
end
