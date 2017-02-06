name 'firefox_configuration'
maintainer 'Alex Markessinis'
maintainer_email 'markea125@gmail.com'
license 'MIT'
description 'Configures FireFox'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
issues_url 'https://github.com/MelonSmasher/chef_firefox_configuration/issues' if respond_to?(:issues_url)
source_url 'https://github.com/MelonSmasher/chef_firefox_configuration' if respond_to?(:source_url)
version '0.2.1'
supports 'windows'
supports 'mac_os_x'
suggest 'firefox'