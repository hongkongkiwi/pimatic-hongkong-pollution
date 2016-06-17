# pimatic-hongkongpollution

Hong Kong Pollution Readings and Forecasts for [Pimatic](https://pimatic.org). This plugin uses the node.js module [hongkong-pollution](https://www.github.com/hongkongkiwi/node-hongkongpollution) to grab the information.

Data is taken from the [Hong Kong Environmental Departments Website](http://www.aqhi.gov.hk/en.html) and [RSS feed](http://www.aqhi.gov.hk/epd/ddata/html/out/aqhirss_Eng.xml). In Hong Kong, pollution is a big consideration as it is for many large cities. The reason for developing this module is so that you can have reminders to wear a pollution mask, stay indoors or combine it with other modules in Pimatic so you can automatically turn on the indoor Air Filter.

## Plugin Configuration

--------------------------------------------------------------------------------

You can load the plugin by editing your `config.json` to include:

```json
{
   "plugin": "hongkongpollution"
}
```

in the `plugins` Array.

## Device Configuration

Devices can be added by adding them to the `devices` Array in the config file. Set the `class` property to `GpioSwitch`, `GpioPresence`, or `GpioContact`

For device configuration options see the [device-config-schema](device-config-schema.coffee) file.

### Device examples

#### Pollution Forecast Device

This gives you a general forecast of the AQHI for the whole day, including a human friendly "Risk" as well as the aggregated AQHI reading.

```json
{
  "id": "pollution-forecast",
  "name": "HK Pollution Forecast",
  "class": "PollutionForecastDevice",
  "showRoadsideAQHI": true,
  "showGeneralAQHI": true,
  "showRoadsideRisk": true,
  "showGeneralRisk": true
}
```

#### Pollution Readings Device

This allows you to show all pollution readings for a specific area such as (PM2.5,PM10,NO2,SO2,O3,CO)[docs/Air_Quality_Readings.md].

The most important setting is which reporting station to use. (Click here)[docs/Monitoring_Stations.md] for more information about which reporting station to use for your district.

```json
{
  "id": "pollution-readings",
  "name": "HK Pollution Readings",
  "class": "PollutionReadingsDevice",
}
```

## Air Quality information

- [List of Air Monitoring Stations in HK](docs/Monitoring_Stations.md)
- [Air Quality Reading Explanations](docs/Air_Quality_Readings.md)

## Contributing

Feel free to submit any pull requests or add functionality, I'm usually pretty responsive.

If you like the module, please consider donating some bitcoin or litecoin.

**Bitcoin**

![LNzdZksXcCF6qXbuiQpHPQ7LUeHuWa8dDW](http://i.imgur.com/9rsCfv5.png?1)

**LiteCoin**

![LNzdZksXcCF6qXbuiQpHPQ7LUeHuWa8dDW](http://i.imgur.com/yF1RoHp.png?1)
