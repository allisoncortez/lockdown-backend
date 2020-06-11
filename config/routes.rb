Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :games, only: [:index, :create]
      resources :players, only: [:index, :create]
    end
  end

  get 'api/v1/scores/top', to: 'api/v1/games#top_score'
  get 'api/v1/scores/topfive', to: 'api/v1/games#top_scores'
end
