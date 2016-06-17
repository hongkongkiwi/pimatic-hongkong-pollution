module.exports = (env) ->

  assert = env.require 'cassert'

  class HongKongPollutionPlugin extends env.plugins.Plugin
    init: (app, @framework, @config) =>
      env.logger.debug("Plugin Initialized")

      # devices = {
      #   "PollutionForecastDevice": (require './devices/pollution-forecast-device')
      #   "PollutionReadingsDevice": (require './devices/pollution-readings-device')
      # }
      #
      deviceConfigDef = require './device-config-schema'
      PollutionForecastDevice = (require './devices/pollution-forecast-device') env

      console.log(PollutionForecastDevice);

      #console.log(new PollutionForecastDevice(config))
      #
      # for k of devices
      #   @framework.deviceManager.registerDeviceClass(k, {
      #      configDef: deviceConfigDef[k],
      #      createCallback: (config) =>
      #        Device = devices[k](env)
      #        return new Device(config)
      #     })
      @framework.deviceManager.registerDeviceClass("PollutionForecastDevice", {
         configDef: deviceConfigDef.PollutionForecastDevice,
         createCallback: (config) =>
           device = new PollutionForecastDevice(config)
           console.log(device)
           return device
        })

  # Create a instance of my plugin
  plugin = new HongKongPollutionPlugin

  return plugin
