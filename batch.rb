require 'rubygems'
require 'bundler/setup'

require 'sinatra'
require 'tilt/haml'
require 'tilt/sass'
require 'mysql2'
require 'json'

set :haml, format: :html5

client = Mysql2::Client.new(default_group: 'clientbatch')

def media_url(uri = nil)
  File.join('//media.batch.ws', url(uri, false))
end

get '/' do
  haml :index, locals: {
    episodes: client.query(<<-QUERY)
    SELECT *
    FROM episode
    ORDER BY name DESC
    QUERY
  }
end

get '/tracks/:episode_name' do |episode_name|
  content_type :json, charset: 'utf-8'
  client.query(<<-QUERY).to_a.to_json
  SELECT *,
  CAST(start_time AS CHAR) start_time
  FROM track
  WHERE episode_name = '#{episode_name}'
  ORDER BY start_time
  QUERY
end
