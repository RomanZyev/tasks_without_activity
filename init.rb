require 'redmine'

Redmine::Plugin.register :tasks_without_activity do
  name 'Tasks Without Activity'
  author 'Zyev Roman'
  description 'This is a plugin for Redmine'
  version '0.0.2'
  url ''
  author_url 'https://github.com/RomanZyev'

  menu :project_menu, :without_activity, '/list_without_activity',:caption => 'Задачи без активности',
    :after => :issues,
    :param => :project_id
    
  settings :default => {'user_group' => 3}, :partial => 'settings_plugin'
end

require_relative 'lib/mail_action'

Mailer.send :include, Patches::MailerPatch
