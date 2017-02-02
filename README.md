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
- Linux: @todo - Figure out install dir for different flavors of linux. Could use some help here :smirk:

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

### App Update Channel:

This preference determines what types of builds auto-updates will look for. This manages the `channel-prefs.js` file.

Default Value: `"release"`

Ruby usage:

```ruby
node['firefox_configuration']['app.update.channel'] = "esr"
```

JSON usage:

```json
{
  "firefox_configuration": {
    "channel_prefs": {
      "app.update.channel": "esr"
    }
  }
}
```

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

More info: [Mozilla.org](https://developer.mozilla.org/en-US/Firefox/Enterprise_deployment)

