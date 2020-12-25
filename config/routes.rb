Rails.application.routes.draw do
  root 'home#index'
  resources :questions, to: 'home#index'

  namespace :api, { format: 'json' } do
    namespace :v1 do
      resources :questions, only: [:index, :show]
    end
  end
end

