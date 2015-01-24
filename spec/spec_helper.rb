require 'rspec'
require 'rack/test'
require 'webmock/rspec'

ENV['RACK_ENV'] = 'test'

require_relative '../app'

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |conf|
  conf.include Rack::Test::Methods

  def app
    Sinatra::Application
  end

end

