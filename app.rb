require 'sinatra'
require 'httparty'

get '/' do
  @api_response = HTTParty.get('https://api.github.com/emojis');

  @emojis = JSON.parse(@api_response.body);

  erb :index
end

