FROM jekyll/jekyll:3.8

RUN apk add build-base

ADD Gemfile Gemfile

RUN bundle install