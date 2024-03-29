require 'active_support/all'
require 'numbers_and_words'
require 'csv'
require 'quickbooks-ruby'

module Finenso
  class Config
    def data_dir
      File.expand_path("../../data", __FILE__)
    end

    def assets_dir
      File.expand_path("../../assets", __FILE__)
    end

    def target_dir
      File.expand_path("../../target", __FILE__)
    end
  end

  def self.config
    @config ||= Config.new
  end
end

Dir[File.dirname(__FILE__) + "/finenso/**/*.rb"].each {|f| require f}

Finenso::EnvInitializer.load_env_vars

#Disabling locale check
I18n.config.enforce_available_locales = false
