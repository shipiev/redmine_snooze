Redmine::Plugin.register :redmine_contacts_snooze do
  name 'Redmine Contacts Snooze plugin'
  author ''
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
end

Rails.configuration.to_prepare do
  require_dependency 'deal'
  require_dependency 'redmine_contacts_snooze/patches/deal_patch'
  Deal.send(:include, RedmineContactsSnooze::DealPatch)
end

