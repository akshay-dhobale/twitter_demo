class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
    
  end

	 def show
    	# @user = User.find(params[:user_id])
    	# binding.pry
    	@tweet = Tweet.find(params[:id])
  	end


  	def create
	    @user = User.find(params[:user_id])
	    @tweet = @user.tweets.create(tweet_params)
	    redirect_to user_path(@user)
  	end

  	def destroy
      @tweet = Tweet.find(params[:id])
      @tweet.destroy 
       respond_to do |format|
        format.html { redirect_to tweets_path, notice: 'tweet successfully Deleted.' }
        format.js { render :layout => false ,notice: 'tweet successfully Deleted.' }
      end
    end

  private
   # def set_tweet
   #    @tweet = Tweet.find(params[:id])
   #  end


  def tweet_params
      params.require(:tweet).permit(:tweet_body, :user_id)
    end
end
