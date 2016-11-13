require 'bundler'
Bundler.setup(:default, ENV['RACK_ENV'] || :development)

require 'active_record'
ActiveRecord::Base.establish_connection(
  YAML.load(File.open("db/config.yml"))[ENV['RACK_ENV'] || 'development']
)

require_relative 'lib/services/importer'
require_relative 'lib/models/city'
require_relative 'lib/models/artist'
require_relative 'lib/models/song'
require_relative 'lib/models/video'
