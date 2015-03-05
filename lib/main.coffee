{ resolve } = require 'path'

aConstructFn = require 'a-construct-fn'

module.exports = aCliBin = (cli, args...) ->

  dir = null

  if typeof cli is "string"

    dir = cli

    cli = require resolve dir, '..'

  if typeof cli is "function"

    cli = aConstructFn cli, args

  try

    Object.defineProperty cli, 'package',

      value: require resolve dir, '..', 'package.json'

      writeable: false

    cli.run()

  catch err then console.log err.message, err.stack
