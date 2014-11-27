# Description:
#   Get LGTM images from www.lgtm.in
#
# Dependencies:
#   "cheerio": "~0.18.0"
#
# Configuration:
#   None
#
# Commands:
#   hubot lgtm - Get a randome image from www.lgtm.in
#
# Author:
#   silvers

cheerio = require 'cheerio'

module.exports = (robot) ->
  robot.respond /lgtm$/i, (msg) ->
    robot.http('http://www.lgtm.in/g').get() (err, res, body) ->
      if err or res.statusCode isnt 200
        msg.send 'ERROR: cannot get image...'
      else
        $ = cheerio.load body
        url = $('#imageUrl').val()

        msg.send url

