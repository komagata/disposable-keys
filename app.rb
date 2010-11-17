require 'sinatra'
require 'haml'
require 'sass'

set :haml, {:attr_wrapper => '"', :ugly => false}
set :sass, {:style => :expanded}

get '/' do
  haml :index
end

post '/' do
  key = OpenSSL::PKey::RSA.new(1024)
  @private_key = key
  @public_key = key.public_key
  haml :created
end


get '/*.css' do |path|
  content_type 'text/css'
  sass path.to_sym, :sass => {:load_paths => [settings.views]}
end

helpers do
end
