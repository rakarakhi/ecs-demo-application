FROM ruby:2.7.1
RUN mkdir -p /app
WORKDIR /app
COPY . /app
RUN gem install bundler &&  /usr/local/bin/bundle install
EXPOSE 3000
CMD ["/usr/local/bin/bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-e", "development"]
