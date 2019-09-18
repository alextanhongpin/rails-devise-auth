Rails.application.routes.draw do
  root to: 'pages#index'

  get 'health', to: 'pages#health'

  # By setting the :api as module, we ignore the prefix /api in our routes.
  scope module: :api do
    namespace :v1 do
      resources :users

      # API calls for authentication.
      # /v1/auth
      mount_devise_token_auth_for 'User', at: :auth
    end
  end

  devise_scope :user do
    post 'v1/auth/register', to: 'devise_token_auth/registration#create'
    post 'v1/auth/login', to: 'devise_token_auth/sessions#create'
  end

  # Overrides the base path from /users to /auth and additionally the default
  # path names.
  # Also, this is only for HTML rendered pages, for API calls, use the
  # devise_token_auth.
  # /auth
  devise_for :users, path: 'auth', path_names: {
    sign_in: 'login',
    sign_up: 'register',
    sign_out: 'logout'
  }

end
