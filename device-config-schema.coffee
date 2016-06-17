module.exports = {
  title: "pimatic-hongkongpollution device config schemas"
  PollutionReadingsDevice: {
    title: "PollutionReadingsDevice config options"
    type: "object"
    required: ["reportingStation"]
    properties:
      updateInterval:
        description: "seconds delay between polls of pollution server"
        type: "integer"
        default: 3600
      showNO2:
        description: "whether to show Nitrous Dioxide (NO2) readings"
        type: "boolean"
        default: true
      showCO:
        description: "whether to show Carbon Monoxide (CO) readings"
        type: "boolean"
        default: true
      showSO2:
        description: "whether to show Sulfur Dioxide (SO2) readings"
        type: "boolean"
        default: true
      showO3:
        description: "whether to show Ground-Level Ozone (O3) readings"
        type: "boolean"
        default: true
      showPM2_5:
        description: "whether to show Particulate 2.5 (PM2.5) readings"
        type: "boolean"
        default: true
      showPM10:
        description: "whether to show Particulate 10 (PM10) readings"
        type: "boolean"
        default: true
      showAQHI:
        description: "whether to show Air Quality Health Index (AQHI) readings"
        type: "boolean"
        default: true
      reportingStation:
        description: "which reporting station to use for readings"
        type: "string"
        default: "Hong Kong"
        enum: ["Central/Western", "Central & Western","Wan Chai","Eastern","Southern","Kwun Tong","Wong Tai Sin","Kowloon City","Yau Tsim Mong","Sham Shui Po","Tsuen Wan","Kwai Tsing","Islands","Yuen Long","Tuen Mun","North","Tai Po","Shatin","Sai Kung"]
  },
  PollutionForecastDevice: {
      title: "PollutionForecastDevice config options"
      type: "object"
      properties:
        updateInterval:
          description: "seconds delay between polls of the server"
          type: "integer"
          default: 3600
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
          enum: ["en", "tc", "sc"]
    }
}
