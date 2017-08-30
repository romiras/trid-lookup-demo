# Start with heroku-16 as parent image
FROM heroku/heroku:16

# Copy Sinatra app into container
ADD myapp.rb myapp.rb

# Install Sinatra gem
RUN gem install sinatra --no-ri --no-rdoc

# Start Sinatra
CMD ["ruby", "myapp.rb"]
