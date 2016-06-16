module.exports = {
  title: "pimatic-hongkongpollution device config schemas"
  # PollutionForecastFutureDevice: {
  #   title: "HKPollutionForecastDevice config options"
  #   type: "object"
  #   properties:
  #     updateInterval:
  #       description: "the delay between polls of pollution server"
  #       type: "integer"
  #       default: 300000
  #     showRoadside:
  #       description: "whether to show roadside pollution readings"
  #       type: "boolean"
  #       default: true
  #     showGeneral:
  #       description: "whether to show general pollution readings"
  #       type: "boolean"
  #       default: true
  #     langauge:
  #       description: "what language to return the risk in"
  #       type: "string"
  #       default: "en"
  #       options:
  #         hidden: yes
  # },
  PollutionForecastCurrentDevice: {
      title: "HKPollutionAQHIDevice config options"
      type: "object"
      properties:
        updateInterval:
          description: "the delay between polls of pollution server"
          type: "integer"
          default: 300000
        showRoadsideAQHI:
          description: "whether to show roadside pollution readings"
          type: "boolean"
          default: true
        showGeneralAQHI:
          description: "whether to show general pollution readings"
          type: "boolean"
          default: true
        showRoadsideRisk:
          description: "whether to show roadside pollution risk text"
          type: "boolean"
          default: true
        showGeneralRisk:
          description: "whether to show general pollution risk text"
          type: "boolean"
          default: true
        langauge:
          description: "what language to return the risk in"
          type: "string"
          default: "en"
          options:
            hidden: yes
    }
}
