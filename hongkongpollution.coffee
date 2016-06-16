module.exports = (env) ->

  assert = env.require 'cassert'

  HongKongPollution = require 'hongkong-pollution'

  class HongKongPollutionPlugin extends env.plugins.Plugin
    init: (app, @framework, @config) =>
      env.logger.info("Plugin Init")
      deviceConfigDef = require './device-config-schema'

      @framework.deviceManager.registerDeviceClass("HKPollutionAQHICurrentDevice", {
        configDef: deviceConfigDef.HKPollutionAQHICurrentDevice,
        createCallback: (config) => new HKPollutionAQHICurrentDevice(config)
      })

  # Create a instance of my plugin
  plugin = new HongKongWeatherPlugin

  #### DEVICES ####
  class HKPollutionAQHIDevice extends env.devices.devices
    constructor: (@config) ->
      @id = @config.id
      @name = @config.name
      @updateInterval = @config.updateInterval
      @language = @config.language

      @hkPollution = new HongKongPollution({'lang': @language})

      @requestForecast()
      @intervalTimerId = setInterval(@requestForecast, @updateInterval)
      super()

    destroy: () ->
      clearInterval @intervalTimerId if @intervalTimerId?
      super()

  class HKPollutionAQHICurrentDevice extends HKPollutionAQHIDevice
    constructor: (@config) ->
      if @config.showRoadside is true
        @attributes.roadsideAQHIRisk = {
          description: "Roadside Pollution Risk"
          type: "string"
          acronym: 'RdAQHIRisk'
        }
      super(config)

    destroy: () ->
      super()

    requestPollutionUpdate: () =>
      return @_currentRequest = @hkPollution.getForecast()
        .then( (forecast) =>
          if @attributes has roadsideAQHIRisk and forecast.CurrentAQHIReport[0].AQHIRisk
            @emit "roadsideAQHI", Number forecast.CurrentAQHIReport[0].AQHIRisk
        ).catch( (err) =>
          env.logger.error(error.message)
          env.logger.debug(error)
        );

    getRoadsideAQHIRisk: -> @_currentRequest.then( (weather) => Number forecast.CurrentAQHIReport[0].AQHIRisk )

  # For testing...
  plugin.HKPollutionAQHIForecastDevice = HKPollutionAQHIForecastDevice

  return plugin
