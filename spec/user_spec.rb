require 'spec_helper'

describe 'User Page' do

  let(:user_from_github){
    {
      "login" => "stujo",
      "id" => 5696249,
      "avatar_url" => "https://avatars.githubusercontent.com/u/5696249?v=3",
      "gravatar_id" => "",
      "url" => "https://api.github.com/users/stujo",
    }
  }

  before(:each) do
    stub_request(:get, /api.github.com\/users\/stujo/).
      with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
      to_return(status: 200, body: user_from_github.to_json , headers: {})
  end

  it 'should be ok' do
    expect(get '/users/stujo').to be_ok
  end

  it 'should contain user name in heading' do
    get '/users/stujo'
    expect(last_response.body).to include("<h1>Username: #{user_from_github["login"]}</h1>")
  end
end
