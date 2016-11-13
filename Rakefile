require 'active_record_migrations'
ActiveRecordMigrations.load_tasks

task default: %w[test]

task :test do
  ruby "test/importer_test.rb"
end

task :import_from_json, [:file] => :boot do |t, args|
  require 'json'
  data = JSON.parse(File.open(args[:file]).read)
  Importer.run(data)
end

task :boot do
  require_relative 'boot'
end

