chai = require 'chai'
chai.should()

env = {
  require: require,
  plugins: require '../../pimatic/lib/plugins'
}

# env = {
#   require: require,
#   logger: require '../../pimatic/lib/logger',
# }
#
# env.devices = require '../../pimatic/lib/devices'
# env.framework = require '../../pimatic/lib/framework'
# env.plugins = require '../../pimatic/lib/plugins'

      config =
        id: 'test'
        name: 'test device'
        host: 'localhost'
        interval: 200
        retries: 1
        timeout: 2001


plugin = (require '../hongkongpollution') env
#HKPollutionAQHICurrentDevice = require "../devices/pollution-current-device' env

describe 'Pollution Current Device', ->
  #urrentDevice = new HKPollutionAQHICurrentDevice()
  # it 'should be an object', ->
  #   currentDevice.should.exist
