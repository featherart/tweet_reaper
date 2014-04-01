class TweetsFetcherController < ApplicationController
  def index
    puts "**************"
    p params
    puts "**************" 
    if params[:user]
      @tweets = TweetFetcher.tweet_fetch(params[:user])
    end

    if params[:friend1]
      @friends = TweetFetcher.friend_fetch(params[:friend1])
    end
    
    respond_to do |format|
      format.html
      format.json {render json: @tweets}
    end
  end
end
