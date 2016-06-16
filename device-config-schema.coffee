module.exports = {
  title: "pimatic-hongkongpollution device config schemas"
  HKPollutionAQHIForecastDevice: {
    title: "HKPollutionForecastDevice config options"
    type: "object"
    properties:
      updateInterval:
        description: "the delay between polls of pollution server"
        type: "integer"
        default: "5000"
      showRoadside:
        description: "whether to show roadside pollution readings"
        type: "boolean"
        default: true
      showGeneral:
        description: "whether to show general pollution readings"
        type: "boolean"
        default: true
  },
  HKPollutionAQHICurrentDevice: {
      title: "HKPollutionAQHIDevice config options"
      type: "object"
      properties:
        updateInterval:
          description: "the delay between polls of pollution server"
          type: "integer"
          default: "5000"
        showRoadside:
          description: "whether to show roadside pollution readings"
          type: "boolean"
          default: true
        showGeneral:
          description: "whether to show general pollution readings"
          type: "boolean"
          default: true
    }
}
