pimatic-hongkongpollution
=============================
Hong Kong Pollution Readings and Forecasts for (Pimatic)[https://pimatic.org]. This plugin uses the node.js module
[onoff](https://www.github.com/hongkongkiwi/node-hongkongpollution).

Data is taken from the Hong Kong Enviromental Departments Website and JSON feeds. In Hong Kong, pollution is a consideration as it is for many large cities. The reason for developing this module is so that you can have reminders to wear a polution mask or stay indoors on particularly bad days.

Personally I intend to pair it with an air filter to monitor outside pollution readings and automatically turn on/off my air filter.

## Plugin Configuration
-------------
You can load the plugin by editing your `config.json` to include:

```json
{
   "plugin": "hongkongpollution"
}
```

in the `plugins` Array.

## Device Configuration

Devices can be added by adding them to the `devices` Array in the config file.
Set the `class` property to `GpioSwitch`, `GpioPresence`, or `GpioContact`

For device configuration options see the [device-config-schema](device-config-schema.coffee) file.

### Device examples

#### HKPollutionAQHICurrentDevice Device

```json
{
  "id": "hkpollution-current",
  "name": "Hong Kong Pollution Forecast",
  "class": "HKPollutionAQHICurrentDevice",
  "updateInterval": 5000,
  "showRoadside": true,
  "showGeneral": true
}
```
