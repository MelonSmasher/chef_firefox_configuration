# firefox_configuration

Configures various Firefox configuration files.

## Supports:

- Windows :white_check_mark:
- macOS :white_check_mark:
- Linux - Not supported this time. Does not seem challenging to support, just need to locate the firefox configuration directory on different flavors of linux.

## Usage

### firefox_configuration::default

Just include `firefox_configuration` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[firefox_configuration]"
  ]
}
```


## Attributes 

### Firefox Install Directory:

Tells this cookbook where to look for Firefox.

Default Value: 

- Windows: `C:/Program Files/Mozilla Firefox/`
- macOS: `/Applications/Firefox.app/Contents/Resources/`
- Linux: @todo: Figure out install dir for different flavors of linux. Could use some help here :wink:

Ruby usage:

```ruby
node['firefox_configuration']['install_directory'] = "D:/Firefox/"
```

JSON usage:

```json
{
  "firefox_configuration": {
    "install_directory": "D:/Firefox/"
  }
}
```

###### Note: forward slashes are used for Windows paths in Ruby.

### Enable Profile Migrator

Sets the `EnableProfileMigrator` in the `override.ini` file that disables the initial profile migrator.

Default Value: `"true"`

Ruby usage:

```ruby
node['firefox_configuration']['enable_profile_migrator'] = "false"
```

JSON usage:

```json
{
  "firefox_configuration": {
    "enable_profile_migrator": "false"
  }
}
```
###### Note: use a string value of the boolean here

### App Update Channel:

This preference determines what types of builds auto-updates will look for. This manages the `channel-prefs.js` file.

Default Value: `"release"`

Possible Values:

- "release" - All final releases.
- "esr" - Special release channel for [extended support releases](http://www.mozilla.org/en-US/firefox/organizations/faq/).
- "beta" - Betas / release candidates (up to Gecko 2.0 also final releases).
- "aurora" - Pre-beta
- "nightly" - All nightly builds.
- "default" - No updates are offered.

Ruby usage:

```ruby
node['firefox_configuration']['app_update_channel'] = "esr"
```

JSON usage:

```json
{
  "firefox_configuration": {
    "app_update_channel": "esr"
  }
}
```

More info:
- [Mozilla KB](http://kb.mozillazine.org/App.update.channel)

### Preferences:

Sets the preference as if a user had set it, every time you start the browser. So users can make changes, but they will be erased on restart. If you set a particular preference this way, it shows up in about:config as "user set". These settings are set in the mozilla.cfg file. Any valid firefox preference string can be a member of the hash. 


Ruby usage:

```ruby
node['firefox_configuration']['prefs'] = [ 
    "browser.shell.checkDefaultBrowser" => false,
    "browser.startup.homepage_override.mstone" => "ignore",
    "browser.rights.3.shown" => true,
    "toolkit.telemetry.prompted" => true
  ]
```

JSON usage:

```json
{
  "firefox_configuration": {
    "prefs": {
      "browser.shell.checkDefaultBrowser": false,
      "browser.startup.homepage_override.mstone": "ignore",
      "browser.rights.3.shown": true,
      "toolkit.telemetry.prompted": true
    }
  }
}
```

More info:
- [Preferences](http://kb.mozillazine.org/Category:Preferences)
- [Mozilla.org](https://developer.mozilla.org/en-US/Firefox/Enterprise_deployment)

### Default Preferences:

Is used to alter the default value, though users can set it normally and their changes will be saved between sessions. If preferences are reset to default through the GUI or some other method, this is what they will go back to. Appears in about:config as "default". These settings are set in the mozilla.cfg file. Any valid firefox preference string can be a member of the hash. 


Ruby usage:

```ruby
node['firefox_configuration']['default_prefs'] = [ 
    "browser.startup.homepage" => "data:text/plain,browser.startup.homepage=https://www.google.com"
  ]
```

JSON usage:

```json
{
  "firefox_configuration": {
    "default_prefs": {
      "browser.startup.homepage": "data:text/plain,browser.startup.homepage=https://www.google.com"
    }
  }
}
```

More info:
- [Preferences](http://kb.mozillazine.org/Category:Preferences)
- [Mozilla.org](https://developer.mozilla.org/en-US/Firefox/Enterprise_deployment)


### Lock Preferences:

Is used to lock preferences so they cannot be changed through the GUI or about:config. In many cases the GUI will change to reflect this, graying out or removing options. Appears in about:config as "locked". Some config items require lockPref to be set, such as app.update.enabled. It will not work if it set with just pref. These settings are set in the mozilla.cfg file. Any valid firefox preference string can be a member of the hash. 


Ruby usage:

```ruby
node['firefox_configuration']['lock_prefs'] = [
    "app.update.enabled" => false,
    "app.update.auto" => false,
    "app.update.mode" => 0,
    "app.update.service.enabled" => false,
    "datareporting.policy.dataSubmissionEnabled" => false,
    "datareporting.healthreport.service.enabled" => false,
    "toolkit.crashreporter.enabled" => false
  ]
```

JSON usage:

```json
{
  "firefox_configuration": {
    "lock_prefs": {
      "app.update.enabled": false,
      "app.update.auto": false,
      "app.update.mode": 0,
      "app.update.service.enabled": false,
      "datareporting.policy.dataSubmissionEnabled": false,
      "datareporting.healthreport.service.enabled": false,
      "toolkit.crashreporter.enabled": false
    }
  }
}
```

More info:
- [Preferences](http://kb.mozillazine.org/Category:Preferences)
- [Mozilla.org](https://developer.mozilla.org/en-US/Firefox/Enterprise_deployment)


### Clear Preferences:

Can be used to "blank" certain preferences. This can be useful e.g. to disable functions that rely on comparing version numbers. These settings are set in the mozilla.cfg file. Any valid firefox preference string can be a member of the array.

Ruby usage:

```ruby
node['firefox_configuration']['clear_prefs'] = [
    "extensions.lastAppVersion",
    "plugins.update.url"
  ]
```

JSON usage:

```json
{
  "firefox_configuration": {
    "clear_prefs": [
      "extensions.lastAppVersion",
      "plugins.update.url"
    ]
  }
}
```

More info:
- [Preferences](http://kb.mozillazine.org/Category:Preferences)
- [Mozilla.org](https://developer.mozilla.org/en-US/Firefox/Enterprise_deployment)


### User Chrome CSS:

CSS attributes that are applied to the `userChrome.css` file. These will control visual elements within firefox.

Ruby usage:

```ruby
node['firefox_configuration']['user_chrome_css'] = [
    "#systemDefaultsGroup" => "display: none !important;",
    "#updateApp" => "display: none !important;",
    "#updateButton" => "display: none !important;"
  ]
```

JSON usage:

```json
{
  "firefox_configuration": {
    "user_chrome_css": {
      "#systemDefaultsGroup": "display: none !important;",
      "#updateApp": "display: none !important;",
      "#updateButton": "display: none !important;"
    }
  }
}
```

More info:
- [Mozilla KB](http://kb.mozillazine.org/Category:Visual_customizations_%28Firefox%29)