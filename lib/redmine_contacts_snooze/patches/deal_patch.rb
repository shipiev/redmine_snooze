require_dependency 'issue'
require_dependency 'issue_relation'

module RedmineContactsSnooze
  module DealPatch
    def self.included(base)
      
        base.send(:include, InstanceMethods) 

        base.class_eval do 
          
          has_one :snooze
          after_create :setup_snooze

        end
        
    end

    module InstanceMethods      
      
      Rails.logger.error("deal owerwrite".red)

      def setup_snooze
        self.create_snooze(next_alarm: Date.today + 3.days, description: 'Auto setup.')
      end
      
    end
    
  end

end

