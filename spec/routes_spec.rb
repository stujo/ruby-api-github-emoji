require 'spec_helper'

describe 'Home Page' do

  let(:emojis_from_github){

    {
      "+1" => "https://github.global.ssl.fastly.net/images/icons/emoji/+1.png?v5",
      "-1" => "https://github.global.ssl.fastly.net/images/icons/emoji/-1.png?v5",
      "100" => "https://github.global.ssl.fastly.net/images/icons/emoji/100.png?v5",
      "1234" => "https://github.global.ssl.fastly.net/images/icons/emoji/1234.png?v5",
      "8ball" => "https://github.global.ssl.fastly.net/images/icons/emoji/8ball.png?v5",
      "a" => "https://github.global.ssl.fastly.net/images/icons/emoji/a.png?v5",
      "ab" => "https://github.global.ssl.fastly.net/images/icons/emoji/ab.png?v5"
    }
  }

  before(:each) do
    stub_request(:get, /api.github.com\/emojis/).
      with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
      to_return(status: 200, body: emojis_from_github.to_json , headers: {})
  end

  it 'should be ok' do
    expect(get '/').to be_ok
  end

  it 'should contain emojis from github api' do
    get '/'
    expect(last_response.body).to include('src="https://github.global.ssl.fastly.net/images/icons/emoji/1234.png?v5"')
  end
end
