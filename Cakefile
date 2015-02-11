
process.env.NODE_PATH = '/usr/local/lib/node_modules'

cp = require 'child_process'

task 'test','run tests', ->
  cp.spawn "mocha"
    ,[ '--require', 'espower-coffee/guess', 'spec/*']
    ,{ stdio: 'inherit' }

