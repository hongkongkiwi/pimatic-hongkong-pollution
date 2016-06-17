module.exports = (env) ->

  Promise = env.require 'bluebird'
  HongKongPollution = require 'hongkong-pollution'

  class PollutionReadingsDevice extends env.devices.Device
    constructor: (@config) ->
      env.logger.debug("PollutionReadingsDevice Constructed")
      @id = @config.id
      @name = @config.name
      @updateInterval = @config.updateInterval
      @reportingStation = @config.reportingStation

      @hkPollution = new HongKongPollution {lang: @language or "en"}

      attributes:
        PM10:
          description: "PM10 Respirable Suspended Particulates"
          type: "number"
          acronym: 'PM10'
          unit: "µg/m3"
        PM2_5:
          description: "PM2.5 Respirable Suspended Particulates"
          type: "number"
          acronym: 'PM2.5'
          unit: "µg/m3"
        O3:
          description: "Ozone Readings (O3)"
          type: "number"
          acronym: 'O3'
          unit: "µg/m3"
        SO2:
          description: "Sulfur Dioxide Readings"
          type: "number"
          acronym: 'SO2'
          unit: "µg/m3"
        NO2:
          description: "Nitrogen Dioxide Readings"
          type: "number"
          acronym: 'NO2'
          unit: "µg/m3"
        CO:
          description: "Carbon Monoxide Readings"
          type: "number"
          acronym: 'CO'
          unit: "µg/m3"
        AQHI:
          description: "AQHI Reading"
          type: "number"
          acronym: 'AQHI'
          default: 0

      if @reportingStation?
        @requestPollutionReading()

      @_pm10 = 0
      @pm2_5 = 0
      @no2 = 0
      @so2 = 0
      @co = 0
      @aqhi = 0
      @o3 = 0

      super()
      @intervalTimerId = setInterval(@requestPollutionReading, @updateInterval * 1000)
      @requestPollutionReading()

    destroy: () ->
      clearInterval @intervalTimerId if @intervalTimerId?
      super()

    requestPollutionReading: () =>
      @hkPollution.getDistrictReadings(@reportingStation)
        .then( (districtReadings) =>
          # Format in a pretty way
          districtReadings = districtReadings.Districts[0].Stations[0];
          @_no2 = districtReadings.NO2
          @_aqhi = districtReadings.AQHI
          @emit "NO2", Number @_no2
          @emit "AQHI", Number @_aqhi
          env.logger.debug("PollutionReadingsDevice Got Readings", districtReadings)
          return districtReadings
        ).catch( (error) =>
          env.logger.error(error.message)
          env.logger.debug(error)
        );

    getPM10: -> Promise.resolve( Number @_pm10 )
    getPM2_5: -> Promise.resolve( Number @_pm2_5 )
    getO3: -> Promise.resolve( Number @_o3 )
    getSO2: -> Promise.resolve( Number @_so2 )
    getNO2: -> Promise.resolve( Number @_no2 )
    getCO: -> Promise.resolve( Number @_co )
    getAQHI: -> Promise.resolve( Number @_aqhi )
