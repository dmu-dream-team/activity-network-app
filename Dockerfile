# MittMedia Sparrow Base Dockerfile
# ---------------------------------

## Start image and add some addons
FROM ruby:2.5.3-alpine
RUN apk --no-cache add vim build-base nodejs postgresql-dev git linux-headers cmake tzdata && \

## Set TZ info
RUN cp /usr/share/zoneinfo/Europe/Stockholm /etc/localtime
RUN echo "Europe/Stockholm" >  /etc/timezone

## Create the sparrow base directory
RUN mkdir /app
WORKDIR /app

## Bundle everything. gemfile.lock is reverted afterwards
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

## Bundle All the node modules
COPY package.json /app/package.json
COPY package-lock.json /app/package-lock.json
RUN npm install

COPY . /app
