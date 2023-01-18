Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/recipes', to: 'recipes#show'
      get '/learning_resources', to: 'resources#show'
      resources :users, only: [:create]
    end
  end
end
