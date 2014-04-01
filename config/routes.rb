TweetReaper::Application.routes.draw do
  
  root to: "tweets_fetcher#index"
  resources :tweets_fetcher, only: [:index]

  #get "tweets_fetcher/index"
end