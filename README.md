pimatic-hongkongpollution
=============================
Hong Kong Pollution Readings and Forecasts for (Pimatic)[https://pimatic.org]. This plugin uses the node.js module
[onoff](https://www.github.com/hongkongkiwi/node-hongkongpollution).

Plugin Configuration
-------------
You can load the plugin by editing your `config.json` to include:

    {
       "plugin": "hongkongpollution"
    }

in the `plugins` Array.

Device Configuration
-------------
Devices can be added by adding them to the `devices` Array in the config file.
Set the `class` property to `GpioSwitch`, `GpioPresence`, or `GpioContact`

For device configuration options see the [device-config-schema](device-config-schema.coffee) file.

### Device examples

#### HKPollutionAQHICurrentDevice Device

{
  "id": "hkpollution-current",
  "name": "Hong Kong Pollution Forecast",
  "class": "HKPollutionAQHICurrentDevice",
  "updateInterval": 5000,
  "showRoadside": true,
  "showGeneral": true
}
