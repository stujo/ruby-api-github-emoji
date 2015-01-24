require 'spec_helper'

describe 'Home Page' do 
  it 'should be ok' do
    expect(get '/').to be_ok
  end  
end
  
