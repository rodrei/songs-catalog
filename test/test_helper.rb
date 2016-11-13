require 'bundler'
Bundler.setup(:default, :test)

require 'minitest/autorun'
require 'minitest/spec'
require 'active_record'
require 'database_cleaner'
require_relative '../lib/services/importer'
require_relative '../lib/models/city'
require_relative '../lib/models/artist'
require_relative '../lib/models/song'
require_relative '../lib/models/video'

ActiveRecord::Base.establish_connection(
  YAML.load(File.open("db/config.yml"))['test']
)

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

class Minitest::Spec
  before :each do
    DatabaseCleaner.start
  end

  after :each do
    DatabaseCleaner.clean
  end
end
