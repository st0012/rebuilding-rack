require "webrick"
include WEBrick

module Plank
  class Handler
    def self.default
      Plank::Handler::WEBrick
    end

    class WEBrick
      def self.run(app, options)
        server = ::WEBrick::HTTPServer.new(options)
        server.mount_proc '/' do |req, res|
          res.status = app.call[0]
          res.content_type = app.call[1]["Content-Type"]
          res.body = app.call[-1].join(",")
        end
        server.start
      end
    end
  end
end