host = ENV.fetch('REDIS_HOST', '127.0.0.1')
port = ENV.fetch('REDIS_HOST', '6379')
url = "redis://#{host}:#{port}"

Sidekiq.configure_server do |config|
  config.redis = { url: url }
end

Sidekiq.configure_client do |config|
  config.redis = { url: url }
end
