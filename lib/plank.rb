require "lib/plank/handler.rb"
require "lib/plank/builder.rb"

module Plank
  class Server

    PORT = "9292"
    HOST = "localhost"
    ENVIRONMENT = "development"

    def initialize(args)
      @options = default_options
      @options[:config] = args[0]
      @app = build_app
    end

    def self.start
      new(ARGV).start
    end

    def start
      server.run @app, @options
    end

    private

    def default_options
      {
        environment: ENVIRONMENT,
        Port: PORT,
        Host: HOST
      }      
    end

    def server
      @server ||= Plank::Handler.default
    end

    def build_app
      Plank::Builder.parse_file(@options[:config])
    end
  end
end
