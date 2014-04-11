TweetReaper::Application.routes.draw do
  
  root to: "tweets_fetcher#index"
  resources :tweets_fetcher, only: [:index, :create]
  #post "tweets_fetcher/create"
  #get '/patients/:id', to: 'patients#show'
  post "/create", to: "tweets_fetcher#create"
end