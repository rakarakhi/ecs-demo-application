FROM ruby:2.7.1
RUN mkdir -p /usr/src/ecsdemo
COPY . /usr/src/ecsdemo
WORKDIR /usr/src/ecsdemo
RUN gem install bundler && /usr/local/bin/bundle install
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
        echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list && \
        apt-get update -qq && \
        apt-get install apt-transport-https && \
        apt-get install -qq --no-install-recommends \
        apt-utils \
        build-essential \
        nodejs \
        npm \
        yarn
EXPOSE 3000
CMD ["/usr/local/bin/bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-e", "development"]
