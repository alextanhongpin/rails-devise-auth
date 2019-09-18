class TestWorker
  include Sidekiq::Worker

  def perform(msg)
    puts("worker got: #{msg}")
  end
end
