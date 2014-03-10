require 'active_support/all'
require 'numbers_and_words'
require 'csv'

module Finenso
end

Dir[File.dirname(__FILE__) + "/finenso/**/*.rb"].each {|f| require f}
