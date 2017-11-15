class CommentsController < ApplicationController
	def create
    # binding.pry
    @tweet = Tweet.find(params[:tweet_id])
    @comment = @tweet.comments.new(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.html { redirect_to tweet_path(@tweet), notice: 'User was successfully comment.' }
      else
        format.html { redirect_to tweet_path(@tweet),  notice: 'comment can not be blank!!.'}
      end
    end
  end


  def destroy
    binding.pry
    @tweet = Tweet.find(params[:id])
    @tweet.destroy 
     respond_to do |format|
      format.html { redirect_to tweets_path, notice: 'tweet successfully Deleted.' }
      format.js { render :layout => false ,notice: 'tweet successfully Deleted.' }
    end
  end

   private
    def comment_params
      params.require(:comment).permit(:comment_body, :user_id, :tweet_id)
    end
end
