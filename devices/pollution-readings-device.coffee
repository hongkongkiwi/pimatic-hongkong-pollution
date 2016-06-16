module.exports = (env) ->

  Promise = env.require 'bluebird'
  HongKongPollution = require 'hongkong-pollution'

  class PollutionReadingsDevice extends env.devices.Device
    constructor: (@config) ->
      @id = @config.id
      @name = @config.name
      @updateInterval = @config.updateInterval

      @hkPollution = new HongKongPollution {lang: @language or "en"}

      @_roadsideAQHI = {}
      @_generalAQHI = {}

      @attributes
        PM10:
          description: "PM 10 Readings"
          type: "number"
          acronym: 'PM10'
        PM2_5:
          description: "PM 2.5 Readings"
          type: "number"
          acronym: 'PM2.5'
        O3:
          description: "O3 Readings"
          type: "number"
          acronym: 'O3'
        SO2:
          description: "SO2 Readings"
          type: "number"
          acronym: 'SO2'
        AQHI:
          description: "AQHI Reading"
          type: "number"
          acronym: 'AQHI'

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
