module.exports = (env) ->

  Promise = env.require 'bluebird'
  HongKongPollution = require 'hongkong-pollution'

  class PollutionForecastDevice extends env.devices.Device
    constructor: (@config) ->
      @id = @config.id
      @name = @config.name
      @updateInterval = @config.updateInterval
      @language = @config.language

      @hkPollution = new HongKongPollution {lang: @language or "en"}

      @_roadsideAQHI = {}
      @_generalAQHI = {}

      if @config.showRoadsideRisk is true
        @attributes.roadsideRisk = {
          description: "Roadside Pollution Risk"
          type: "string"
          acronym: 'Roadside Risk'
        }
      if @config.showGeneralRisk is true
        @attributes.generalRisk = {
          description: "General Pollution Risk"
          type: "string"
          acronym: 'Risk'
        }
      if @config.showRoadsideAQHI is true
        @attributes.roadsideAQHIUpper = {
          description: "Roadside Pollution AQHI Upper"
          type: "number"
          acronym: 'Roadside AQHI ▲'
        }
        @attributes.roadsideAQHILower = {
          description: "Roadside Pollution AQHI Lower"
          type: "number"
          acronym: 'Roadside AQHI ▼'
        }
      if @config.showGeneralAQHI is true
        @attributes.generalAQHIUpper = {
          description: "General Pollution AQHI Upper"
          type: "number"
          acronym: 'AQHI ▲'
        }
        @attributes.generalAQHILower = {
          description: "General Pollution AQHI Lower"
          type: "number"
          acronym: 'AQHI ▼'
        }

      @requestPollutionForecast()
      @intervalTimerId = setInterval(@requestPollutionForecast, @updateInterval * 1000)
      super()

    destroy: () ->
      clearInterval @intervalTimerId if @intervalTimerId?
      super()

    requestPollutionForecast: () =>
      @hkPollution.getForecast()
        .then( (forecast) =>
          @_roadsideRisk = forecast.CurrentAQHIReport[0].AQHIRisk
          @emit "roadsideRisk", String @_roadsideRisk

          @_generalRisk = forecast.CurrentAQHIReport[1].AQHIRisk
          @emit "generalRisk", String @_generalRisk

          @_roadsideAQHI = forecast.CurrentAQHIReport[0].AQHIRange
          @emit "roadsideAQHIUpper", Number @_roadsideAQHI.Upper
          @emit "roadsideAQHILower", Number @_roadsideAQHI.Lower

          @_generalAQHI = forecast.CurrentAQHIReport[1].AQHIRange
          @emit "generalAQHIUpper", Number @_generalAQHI.Upper
          @emit "generalAQHILower", Number @_generalAQHI.Lower

          return forecast.CurrentAQHIReport;

        ).catch( (error) =>
          env.logger.error(error.message)
          env.logger.debug(error)
        );

    getRoadsideRisk: -> Promise.resolve( String @_roadsideRisk )
    getGeneralRisk: -> Promise.resolve( String @_generalRisk )
    getRoadsideAQHIUpper: -> Promise.resolve( Number @_roadsideAQHI.Upper )
    getRoadsideAQHILower: -> Promise.resolve( Number @_roadsideAQHI.Lower )
    getGeneralAQHIUpper: -> Promise.resolve( Number @_generalAQHI.Upper )
    getGeneralAQHILower: -> Promise.resolve( Number @_generalAQHI.Lower )
