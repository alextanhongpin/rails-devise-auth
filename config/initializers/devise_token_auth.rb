# frozen_string_literal: true

DeviseTokenAuth.setup do |config|

  config.change_headers_on_each_request = false

  config.token_lifespan = 2.weeks

  config.token_cost = Rails.env.test? ? 4 : 10

  config.max_number_of_devices = 10

  config.batch_request_buffer_throttle = 5.seconds

  config.omniauth_prefix = "/oauth"

  config.check_current_password_before_update = :attributes

  config.default_callbacks = true

  # Makes it possible to change the headers names
  # config.headers_names = {:'access-token' => 'access-token',
  #                        :'client' => 'client',
  #                        :'expiry' => 'expiry',
  #                        :'uid' => 'uid',
  #                        :'token-type' => 'token-type' }

  
  config.default_confirm_success_url = 'http://localhost:3000/confirmed'
  config.default_password_reset_url = 'http://localhost:3000/reset_url'
  config.remove_tokens_after_password_reset = true
end
