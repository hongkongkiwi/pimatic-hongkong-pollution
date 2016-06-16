module.exports = (env) ->

  assert = env.require 'cassert'

  class HongKongPollutionPlugin extends env.plugins.Plugin
    init: (app, @framework, @config) =>
      env.logger.info("Plugin Init")

      devices = {
        "PollutionForecastDevice": (require './devices/pollution-forecast-device') env
        "PollutionReadingsDevice": (require './devices/pollution-readings-device') env
      }

      deviceConfigDef = require './device-config-schema'

      for k of devices
        @framework.deviceManager.registerDeviceClass(k, {
           configDef: deviceConfigDef[k],
           createCallback: (config) => new devices[k](config)
          })

  # Create a instance of my plugin
  plugin = new HongKongPollutionPlugin

  return plugin
