Redmine::Plugin.register :redmine_snooze do
  name 'Redmine Snooze plugin'
  author ''
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
end

Rails.configuration.to_prepare do
  require_patch :redmine_snooze, %w[deal note]
end

