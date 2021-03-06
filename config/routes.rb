Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :v1 do
    mount_devise_token_auth_for 'User', at: 'auth',
                                skip: [:omniauth_callbacks],
                                controllers: { registrations: 'v1/auth/registrations' }
    resources :phrases, only: :index
    resources :levels, only: :index
    resources :scores, only: [:index, :create]
  end
end
