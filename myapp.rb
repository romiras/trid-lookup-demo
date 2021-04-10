require 'sinatra'
require './trid'

set :bind, '0.0.0.0'
set :logging, true

get '/' do
  "File type detector"
end

post '/detect' do
  unless params[:file] &&
    (tmpfile = params[:file][:tempfile]) &&
    (filename = params[:file][:filename])

    return 'No file uploaded'
  end

  response = stream do |out|
    out.callback { logger.info "Deleting temporary file..." ; tmpfile.unlink }

    TrID::analyze(tmpfile.path) do |line|
      out << line
    end
  end

end
