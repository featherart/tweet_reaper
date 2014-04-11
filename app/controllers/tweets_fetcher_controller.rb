class TweetsFetcherController < ApplicationController
  respond_to :json

  def index
    puts "**************"
    puts "in index"
    p params
    puts "**************" 
    @tweets = []

    if params[:name]
      @tweets = TweetFetcher.tweet_fetch(params[:name])
    end

    if params[:friend]
      @friends = TweetFetcher.friend_fetch(params[:friend]).map { |f| f.name }
    end

    if params[:friend1] && params[:friend2]
      one = TweetFetcher.friend_fetch(params[:friend1])
      two = TweetFetcher.friend_fetch(params[:friend2])
      
      friends_one = []
      friends_two = []

      one.each { |i| friends_one.push(i.name) } 
      two.each { |i| friends_two.push(i.name) }
  
      @intersection = friends_one & friends_two
    end

    respond_to do |format|
      format.html #{ render root_path }
      format.json {render json: @tweets}
    end
  end

  def create
    puts "*"*50
    puts "in create"
    p params
    puts "*"*50

    #@twitter_user = TwitterUser.create(params[:twitter_user])
    @tweets = TweetFetcher.tweet_fetch(params[:name])

    #respond_with @tweets
    
    #respond_with Tweet.create(name: params[:name], text: @tweets.first.text)
    
  
    redirect_to :back

    #render nothing: true
    #binding.pry
    # respond_to do |format|
    #   format.html {redirect_to root_path}#{ render nothing: true }
    #   format.json {render json: @tweets}
    # end    
  end
end
