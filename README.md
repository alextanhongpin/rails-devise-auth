# README


```bash
$ rails new testapi --api
$ rails db:migrate
$ bin/rake db:setup

# Setup rspec. See the Gemfile.
$ bin/rails g rspec:install

# Scaffold.
$ bin/rails g scaffold user name email
$ rails db:migrate

# Authentication.
gem 'devise'
bundle install
rails g devise:install

rails g devise user
rails db:migrate

# To add to existing user.
rails g devise User

rake db:purge db:migrate db:seed

# To install straight to gem.
$ bundle add faker

# Seems like devise_token_auth and devise is different.
$ rails generate devise_token_auth:install User auth

$ bundle add rack-cors
```

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
