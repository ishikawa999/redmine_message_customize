p = Redmine::Plugin.register :redmine_message_customize do
  name 'Redmine customize messages plugin'
  description 'This is a plugin that allows messages in Redmine to be overwritten from the admin view'
  settings :default => { custom_messages: {} }
  menu :admin_menu, :custom_messages, { controller: 'custom_message_settings', action: 'edit' },
         caption: :label_custom_messages, html: { class: 'icon icon-edit' }
end

Rails.application.config.i18n.load_path += Dir.glob(File.join(p.directory, 'config', 'locales', 'custom_messages', '*.rb'))

class Redmine::I18n::Backend
  public :translations
end