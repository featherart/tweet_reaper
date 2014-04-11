TweetReaper::Application.routes.draw do
  
  root to: "tweets_fetcher#index"
  resources :tweets_fetcher, only: [:index, :create]
<<<<<<< HEAD
  #post "tweets_fetcher/create"
  #get '/patients/:id', to: 'patients#show'
  post "/create", to: "tweets_fetcher#create"
=======
  post "tweets_fetcher/create"
>>>>>>> c6f9a7d6d72306423a928a2882ed2f111ddbbecc
end