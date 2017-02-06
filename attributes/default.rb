case node['platform_family']
  when 'windows'
    default['firefox_configuration']['install_directory'] = 'C:/Program Files/Mozilla Firefox/'
  when 'mac_os_x'
    default['firefox_configuration']['install_directory'] = '/Applications/Firefox.app/Contents/Resources/'
  else
    default['firefox_configuration']['install_directory'] = nil
end

default['firefox_configuration']['enable_profile_migrator'] = "true"
default['firefox_configuration']['app_update_channel'] = "release"
default['firefox_configuration']['user_chrome_css'] = []

default['firefox_configuration']['prefs'] = []
default['firefox_configuration']['default_prefs'] = []
default['firefox_configuration']['lock_prefs'] = []
default['firefox_configuration']['clear_prefs'] = []
