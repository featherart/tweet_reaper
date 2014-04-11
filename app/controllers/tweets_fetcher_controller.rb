class TweetsFetcherController < ApplicationController
  def index
    puts "**************"
    puts "in index"
    p params
    puts "**************" 
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
    #respond_to :json
    @tweets = TweetFetcher.tweet_fetch(params[:name])
    #binding.pry
    redirect_to :back
  end
end
