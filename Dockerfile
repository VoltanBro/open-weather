# syntax=docker/dockerfile:1
FROM ruby:2.7.3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /open-weather
COPY Gemfile /open-weather/Gemfile
COPY Gemfile.lock /open-weather/Gemfile.lock
RUN bundle install

# Add a script to be executed every time the container starts.
COPY docker-entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]