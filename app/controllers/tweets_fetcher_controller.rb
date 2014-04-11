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
<<<<<<< HEAD
      format.html #{ render root_path }
=======
      format.html { render root_path }
>>>>>>> c6f9a7d6d72306423a928a2882ed2f111ddbbecc
      format.json {render json: @tweets}
    end
  end

  def create
    puts "*"*50
    puts "in create"
    p params
    puts "*"*50
<<<<<<< HEAD
    #respond_to :json
    @tweets = TweetFetcher.tweet_fetch(params[:name])
    #binding.pry
    redirect_to :back
=======
    @twitter_user = TwitterUser.create(params[:twitter_user])
    binding.pry
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
>>>>>>> c6f9a7d6d72306423a928a2882ed2f111ddbbecc
  end
end
