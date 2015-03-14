module Plank
  class Builder
    def initialize(&block)
      instance_eval(&block) if block_given?
    end

    def self.parse_file(file)
      config_file = File.read(file)
      new_from_string(config_file)
    end

    def self.new_from_string(builder_script)
      eval "Plank::Builder.new {\n" + builder_script + "\n}.to_app"
    end

    def to_app
      @run
    end

    def run(app)
      @run = app
    end
  end
end