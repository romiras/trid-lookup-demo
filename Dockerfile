FROM heroku/heroku:20-build as builder

# Sets the working directory (Heroku crashes without it)
WORKDIR /app

COPY Gemfile /app
COPY Gemfile.lock /app

RUN gem install bundler --no-document && \
    bundle install -j3 && \
    rm -rf /usr/local/bundle/bundler/gems/*/.git \
    /usr/local/bundle/cache/

RUN curl -s -o /tmp/trid_linux_64.zip https://mark0.net/download/trid_linux_64.zip && \
    unzip /tmp/trid_linux_64.zip trid && \
    chmod a+x ./trid

FROM heroku/heroku:20

RUN mkdir -p /usr/lib/trid && \
    curl -s -o /tmp/triddefs.zip https://mark0.net/download/triddefs.zip && \
    unzip /tmp/triddefs.zip -d /usr/lib/trid

COPY --from=builder /usr/lib/ruby/ /usr/lib/ruby/
COPY --from=builder /var/lib/gems/ /var/lib/gems/
COPY --from=builder /usr/local/bin/ /usr/local/bin/
COPY --from=builder /app/trid /usr/local/bin/trid

# Copy Sinatra app into container
ADD . .

# Run the image as a non-root user
RUN useradd -m myuser
USER myuser

# Start Sinatra
CMD ["bundle", "exec", "ruby", "myapp.rb"]
