require_relative 'boot'
require 'sinatra'

get '/' do
  @cities = City.group('cities.id')
                .select('cities.id, cities.title, count(*) as total_songs')
                .joins(:songs)
                .order('total_songs DESC')
  haml :index
end

