worker:
	@bundle exec sidekiq
	# @bundle exec sidekiq 2>&1 | logger -t sidekiq

up:
	@docker-compose up -d

down:
	@docker-compose down
