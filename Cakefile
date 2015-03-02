
process.env.NODE_PATH = '/usr/local/lib/node_modules'

cp = require 'child_process'

task 'test','run tests', ->
  cp.spawn "mocha"
    ,[ '--require', 'espower-coffee/guess', 'spec/*']
    ,{ stdio: 'inherit' }


build = (callback) ->
  coffee = cp.spawn 'coffee', ['-c', '-o', 'dist', 'src']
  coffee.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  coffee.stdout.on 'data', (data) ->
    print data.toString()
  coffee.on 'exit', (code) ->
    callback?() if code is 0

task 'build', 'Build dist/ from src/', ->
  build()
