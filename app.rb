require 'sinatra'
require 'httparty'

get '/' do
  @api_response = HTTParty.get('https://api.github.com/emojis');

  @emojis = JSON.parse(@api_response.body);

  erb :index
end

get '/users/:github_username' do
  @api_response = HTTParty.get("https://api.github.com/users/#{params[:github_username]}");

  @github_user = JSON.parse(@api_response.body);

  erb :user
end

