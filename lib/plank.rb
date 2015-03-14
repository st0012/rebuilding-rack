module Plank
  class Server
    def initialize
      @options = default_options
      @options[:config] = args[0]
      @app = build_app
    end

    def self.start
      new(args).start
    end

    private

    def default_options
      {
        environment: ENVIRONMENT,
        Port: PORT,
        Host: HOST
      }      
    end

    def build_app
      Plank::Builder.parse_file(options[:config])
    end
  end

  class Builder
    def self.parse_file
       
    end
  end
end
