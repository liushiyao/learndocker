FROM daocloud.io/ruby:2.2.5 
MAINTAINER walrkson <walrkson@gmail.com>

RUN apt-get update -y
RUN gem install bundler -v '1.14.6'

WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install

ADD . /app

EXPOSE 8080

CMD ["rackup", "-o", "0.0.0.0", "-p", "8080"]
