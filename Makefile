-include .env
export

RAILS_ENV=development

start:
	@rails s

install:
	@rails g rspec:install

worker:
	@bundle exec sidekiq
	# @bundle exec sidekiq 2>&1 | logger -t sidekiq

up:
	@docker-compose up -d

down:
	@docker-compose down

migrate:
	# @rails db:environment:set RAILS_ENV=development
	# @rails db:setup
	@rails db:migrate

rollback:
	@rails db:rollback

start-docker:
	@docker run -p 8080:8080 -e SECRET_KEY_BASE=${SECRET_KEY_BASE} rails/api

docker:
	@docker build -t rails/api .
