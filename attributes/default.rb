case node['platform_family']
  when 'windows'
    default['firefox_configuration']['install_directory'] = 'C:/Program Files/Mozilla Firefox/'
  when 'mac_osx'
    default['firefox_configuration']['install_directory'] = '/Applications/Firefox.app/Contents/Resources/'
  else
    default['firefox_configuration']['install_directory'] = nil
end
default['firefox_configuration']['app.update.channel'] = "release"
default['firefox_configuration']