FROM heroku/heroku:20-build as builder

# Sets the working directory (Heroku crashes without it)
WORKDIR /app

COPY Gemfile /app
COPY Gemfile.lock /app

RUN gem install bundler --no-document && \
    bundle install -j3 && \
    rm -rf /usr/local/bundle/bundler/gems/*/.git \
    /usr/local/bundle/cache/


FROM heroku/heroku:20

COPY --from=builder /usr/lib/ruby/ /usr/lib/ruby/
COPY --from=builder /var/lib/gems/ /var/lib/gems/
COPY --from=builder /usr/local/bin/ /usr/local/bin/

RUN gem list && bundle --version

# Copy Sinatra app into container
ADD . .

# Run the image as a non-root user
RUN useradd -m myuser
USER myuser

# Start Sinatra
CMD ["bundle", "exec", "ruby", "myapp.rb"]
