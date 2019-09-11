module Registerer
  # We need to extend this class.
  extend ActiveSupport::Concern

  included do
    before_action :log
  end

  def msg 
    'hello world'
  end

  private

    def log
      puts('heloo world')
    end
end
