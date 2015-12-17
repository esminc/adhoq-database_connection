require 'adhoq/database_connection/version'
require 'active_record'
require 'yaml'

module Adhoq
  class DatabaseConnection
    def self.load_file(model_name, file_path)
      new(model_name, YAML.load_file(file_path))
    end

    def initialize(model_name, config)
      @model_name = model_name
      @config = config
    end

    def call
      @model ||= connect_database
      @model.connection
    end

    def connect_database
      Class.new(ActiveRecord::Base).tap do |model|
        self.class.const_set(@model_name, model)
        model.establish_connection(@config)
      end
    end
  end
end
