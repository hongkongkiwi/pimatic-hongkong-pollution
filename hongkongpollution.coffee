module.exports = (env) ->

  assert = env.require 'cassert'

  PollutionForecastCurrentDevice = (require './devices/pollution-current-device') env

  class HongKongPollutionPlugin extends env.plugins.Plugin
    init: (app, @framework, @config) =>
      env.logger.info("Plugin Init")
      deviceConfigDef = require './device-config-schema'

      @framework.deviceManager.registerDeviceClass("PollutionForecastCurrentDevice", {
         configDef: deviceConfigDef.PollutionForecastCurrentDevice,
         createCallback: (config) => new PollutionForecastCurrentDevice(config)
        })

  # Create a instance of my plugin
  plugin = new HongKongPollutionPlugin

  return plugin
