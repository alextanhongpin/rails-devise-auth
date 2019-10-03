FROM ruby:2.6.5-alpine3.10

ARG BUILD_PACKAGES="build-dependencies build-base ruby-dev openssl-dev libxml2-dev libxslt-dev postgresql-dev libc-dev linux-headers nodejs tzdata"

COPY Gemfile* /app/

RUN apk --update add --virtual $BUILD_PACKAGES && \    
    gem install bundler && cd /app && \
    bundle config build.nokogiri --use-system-libraries && bundle install --without development test

WORKDIR /app
COPY . .

# RUN chown -R nobody:nogroup /
# USER nobody

ENV RAILS_ENV=production
ENV NODE_ENV=production

CMD ["rails", "s", "-p", "8080"]
