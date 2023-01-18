Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/learning_resources', to: 'resources#show'
      resources :recipes, only: [:index]
      resources :users, only: [:create]
      resources :favorites, only: [:create]
    end
  end
end
