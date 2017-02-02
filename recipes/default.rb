#
# Cookbook:: firefox_configuration
# Recipe:: default
#
# MIT

include FirefoxConfiguration::Helpers

# Set the firefox installation base directory
install_path = File.join(node['firefox_configuration']['install_directory'], "")
# Set the preferences directory
prefs_dir = File.join(install_path, "defaults/pref/")
# Set the chrome profile directory
chrome_profile_dir = File.join(install_path, "browser/defaults/profile/chrome/")
# Make sure that directory exists
if File.directory?(install_path)

  ensure_dir prefs_dir
  ensure_dir chrome_profile_dir

else
  # If it does not exists throw a fatal error
  log 'Firefox Install Not Found' do
    message "Could not locate the firefox installation directory at: #{install_path} ... Aborting!"
    level :Fatal
  end
end
