#
# Cookbook:: firefox_configuration
# Recipe:: default
#
# MIT

def ensure_dir(path)
  directory path do
    action :create
    recursive true
  end
end

def create_template(source_template, path)
  template path do
    source source_template
  end
end

# Set the firefox installation base directory
install_path = File.join(node['firefox_configuration']['install_directory'], "")

# Make sure that directory exists
if File.directory?(install_path)

  # Set the preferences directory
  prefs_dir = File.join(install_path, "defaults/pref/")
  # Set the chrome profile directory
  chrome_profile_dir = File.join(install_path, "browser/defaults/profile/chrome/")
  # Set the path to the autoconfig.js file
  autoconfig_js_path = File.join(prefs_dir, 'autoconfig.js')
  # Set the path to the channel-prefs.js file
  channel_prefs_js_path = File.join(prefs_dir, 'channel-prefs.js')
  # Set the path for the mozilla.cfg file
  mozilla_cfg_path = File.join(install_path, 'mozilla.cfg')
  # Set the path for the override.ini file
  override_ini_path = File.join(prefs_dir, 'override.ini')
  # Set the path for the userChrome.css file
  user_chrome_css_path = File.join(chrome_profile_dir, 'userChrome.css')

  # Make sure parent directories exist
  ensure_dir prefs_dir
  ensure_dir chrome_profile_dir

  # Create the template files
  create_template('autoconfig.js.erb', autoconfig_js_path)
  create_template('channel-prefs.js.erb', channel_prefs_js_path)
  create_template('mozilla.cfg.erb', mozilla_cfg_path)
  create_template('override.ini.erb', override_ini_path)
  create_template('userChrome.css.erb', user_chrome_css_path)

else
  # If it does not exists throw a fatal error
  log 'Firefox Install Not Found' do
    message "Could not locate the firefox installation directory at: #{install_path} ... Aborting!"
    level :fatal
  end
end
