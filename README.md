### Setup

  * Run `gem install bundler` and then `bundle install`

  * Run `cp db/config.example.yml db/config.yml` and edit it to include your db
configuration

  * Run `rake db:create db:migrate`

### Tests

  * Run `rake`

### Usage

  * To import a json file run `rake import_from_json[my_file.json]`
  * To start the web app run `ruby app.rb`
  * Visit the root path `/` to see a list of cities ranked by number of
    songs.
