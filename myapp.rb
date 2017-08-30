require 'sinatra'

set :bind, '0.0.0.0'
set :port, ($PORT || 4567)

get '/' do
  "Hello world!"
end
