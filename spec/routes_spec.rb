require 'spec_helper'

describe 'Home Page' do 
  it 'should be ok' do
    expect(get '/').to be_ok
  end  

  it 'should contain emojis from github api' do
    get '/'
    expect(last_response.body).to include('https://assets-cdn.github.com/images/icons/emoji/unicode/1f600.png?v5')
  end
end
