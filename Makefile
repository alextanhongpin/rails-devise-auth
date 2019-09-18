worker:
	@bundle exec sidekiq

up:
	@docker-compose up -d

down:
	@docker-compose down
