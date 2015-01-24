require 'rspec'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

require_relative '../app'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods

  def app
    Sinatra::Application
  end

end

