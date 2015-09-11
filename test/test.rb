require 'rubygems'
require 'bundler/setup'

require 'coveralls'

Coveralls.wear!

require 'rack/test'
require 'test/unit'

require_relative '../batch'

# Test suite for batch.ws.
class SiteTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_root
    get '/'
    assert last_response.ok?
  end

  def test_tracks
    get '/tracks/1'
    assert last_response.ok?
  end
end
